// 
//  HomeSceneViewController.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import UIKit

protocol HomeSceneViewControllerInput: AnyObject {
    func showTodo(_ todo: HomeSceneModel.Fetch.ViewModel)
}

protocol HomeSceneViewControllerOutput: AnyObject {
    func tapAddTodoButton()
}

final class HomeSceneViewController: UIViewController {
    // MARK: - Components
    private lazy var tableView: UITableView = {
        return UITableView()
    }()
    
    private lazy var dataSource: UITableViewDiffableDataSource<Int, Todo> = {
        return UITableViewDiffableDataSource<Int, Todo>(tableView: tableView) { tableView, indexPath, itemIdentifier in
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TodoTableCell.reuseableIdentifier,
                for: indexPath
            ) as? TodoTableCell else {
                return UITableViewCell()
            }
            cell.setup(with: itemIdentifier)
            cell.selectionStyle = .none
            
            return cell
        }
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
                self?.interactor?.tapAddTodoButton()
            }
        )
    }
    
    private func makeSnapshot(with viewModel: HomeSceneModel.Fetch.ViewModel) {
        let todo = viewModel.todo
        
        var snapshot = dataSource.snapshot()
        snapshot.appendItems([todo])
        dataSource.apply(snapshot, animatingDifferences: true)
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
}

/// Implement the requirement of protocol
extension HomeSceneViewController: HomeSceneViewControllerInput {
    func showTodo(_ todo: HomeSceneModel.Fetch.ViewModel) {
        makeSnapshot(with: todo)
    }
}
