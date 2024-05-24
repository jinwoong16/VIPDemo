// 
//  AddTodoSceneViewController.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import UIKit

protocol AddTodoSceneViewControllerInput: AnyObject {
    func dismiss()
}

protocol AddTodoSceneViewControllerOutput: AnyObject {
    func tapAddButton(_ request: AddTodoSceneModel.AddTodo.Request)
}

final class AddTodoSceneViewController: UIViewController {
    // MARK: - Components
    /// Create components which this view controller will manage
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "add todo"
        
        return textField
    }()
    
    // MARK: - Dependencies
    var interactor: AddTodoSceneInteractorInput?
    var router: AddTodoSceneRouterLogic?

    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureNavigationItems()
    }

    // MARK: - Configure Components
    private func configureUI() {
        view.backgroundColor = .white
        
        view.addSubview(textField)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        let global = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: global.centerXAnchor),
            textField.centerYAnchor.constraint(equalTo: global.centerYAnchor),
            textField.widthAnchor.constraint(equalTo: global.widthAnchor, multiplier: 0.75),
        ])
    }
    
    private func configureNavigationItems() {
        navigationItem.title = "Add Todo"
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            systemItem: .cancel,
            primaryAction: UIAction { [weak self] _ in
                self?.dismiss(animated: true)
            }
        )
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            systemItem: .done,
            primaryAction: UIAction { _ in
                // done logic goes here
            }
        )
    }
}

/// Implement the requirement of protocol
extension AddTodoSceneViewController: AddTodoSceneViewControllerInput {
    func dismiss() {
        dismiss(animated: true)
    }
}
