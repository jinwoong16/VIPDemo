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
    /*
    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()

        return textLabel
    }()
    */

    // MARK: - Dependencies
    var interactor: AddTodoSceneInteractorInput?
    var router: AddTodoSceneRouterLogic?

    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Configure Components
    private func configureUI() {

    }
}

/// Implement the requirement of protocol
extension AddTodoSceneViewController: AddTodoSceneViewControllerInput {

}
