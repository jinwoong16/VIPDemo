// 
//  HomeSceneViewController.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import UIKit

protocol HomeSceneViewControllerInput: AnyObject {

}

protocol HomeSceneViewControllerOutput: AnyObject {

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
            cell.setup()
            
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
        
        var snapshot = NSDiffableDataSourceSnapshot<Int, Todo>()
        snapshot.appendSections([0])
//        snapshot.appendItems([Todo(completed: false, description: "1"), Todo(completed: false, description: "1")])
        dataSource.apply(snapshot, animatingDifferences: false)
    }
    
    private func makeSnapshot() {
        
    }
}

/// Implement the requirement of protocol
extension HomeSceneViewController: HomeSceneViewControllerInput {

}
