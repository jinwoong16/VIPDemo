// 
//  HomeSceneViewController.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import UIKit

protocol HomeSceneViewControllerInput: AnyObject {
    func showTodo(_ viewModel: HomeSceneModel.Fetch.ViewModel)
    func showTodos(_ viewModel: HomeSceneModel.FetchAll.ViewModel)
    func showAlert(_ viewModel: HomeSceneModel.Delete.ViewModel)
}

protocol HomeSceneViewControllerOutput: AnyObject {
    func tapAddTodoButton()
    func viewDidLoad()
    func tapDeleteButton(request: HomeSceneModel.Delete.Request)
}

final class HomeSceneViewController: UIViewController {
    // MARK: - Components
    private lazy var tableView: UITableView = {
        return UITableView()
    }()
    
    private lazy var dataSource: TodoDataSource = {
        return TodoDataSource(tableView: tableView)
    }()

    // MARK: - Dependencies
    var interactor: HomeSceneInteractorInput?
    var router: HomeSceneRouterLogic?

    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureTableView()
        configureNavigationItems()
        
        interactor?.viewDidLoad()
    }

    // MARK: - Configure Components
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        let global = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: global.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: global.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: global.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: global.bottomAnchor),
        ])
    }
    
    private func configureTableView() {
        tableView.register(TodoTableCell.self, forCellReuseIdentifier: TodoTableCell.reuseableIdentifier)
        tableView.dataSource = dataSource
        tableView.delegate = self
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, Todo>()
        snapshot.appendSections([0])
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func configureNavigationItems() {
        navigationItem.title = "TodoList"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            systemItem: .add,
            primaryAction: UIAction { [weak self] _ in
                guard let self else { return }
                self.router?.showAddTodoScene(from: self)
            }
        )
    }
    
    private func makeSnapshot(with todos: [Todo]) {
        var snapshot = dataSource.snapshot()
        snapshot.appendItems(todos)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

extension HomeSceneViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var snapshot = dataSource.snapshot()
        let selectedTodo = snapshot.itemIdentifiers[indexPath.row]
        selectedTodo.completed.toggle()
        snapshot.reconfigureItems([selectedTodo])
        
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: "delete"
        ) { [weak self] action, view, success in
            guard let self else { return }
            
            var snapshot = self.dataSource.snapshot()
            
            let item = snapshot.itemIdentifiers[indexPath.row]
            snapshot.deleteItems([item])
            
            self.dataSource.apply(snapshot)
            self.interactor?.tapDeleteButton(request: .init(data: item))
        }
        
        deleteAction.image = UIImage(systemName: "trash")
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

/// Implement the requirement of protocol
extension HomeSceneViewController: HomeSceneViewControllerInput {
    func showTodo(_ viewModel: HomeSceneModel.Fetch.ViewModel) {
        Task {
            await MainActor.run { [weak self] in
                self?.makeSnapshot(with: [viewModel.todo])
            }
        }
    }
    
    func showTodos(_ viewModel: HomeSceneModel.FetchAll.ViewModel) {
        Task {
            await MainActor.run { [weak self] in
                self?.makeSnapshot(with: viewModel.todos)
            }
        }
    }
    
    func showAlert(_ viewModel: HomeSceneModel.Delete.ViewModel) {
        Task {
            await MainActor.run { [weak self] in
                switch viewModel.result {
                    case .success:
                        self?.showAlert(title: "Success", message: "Successfully delete the todo")
                    case .failure:
                        self?.showAlert(title: "Failed", message: "Sorry, it could not make it")
                }
            }
        }
    }
}

extension HomeSceneViewController: Alertable {}
