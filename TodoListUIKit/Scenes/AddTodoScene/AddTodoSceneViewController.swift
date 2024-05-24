// 
//  AddTodoSceneViewController.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import UIKit

protocol AddTodoSceneViewControllerInput: AnyObject {

}

protocol AddTodoSceneViewControllerOutput: AnyObject {

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
}

/// Implement the requirement of protocol
extension AddTodoSceneViewController: AddTodoSceneViewControllerInput {

}
