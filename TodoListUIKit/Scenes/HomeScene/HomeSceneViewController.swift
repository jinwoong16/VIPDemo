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
    /// Create components which this view controller will manage
    /*
    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()

        return textLabel
    }()
    */

    // MARK: - Dependencies
    var interactor: HomeSceneInteractorInput?
    var router: HomeSceneRouterLogic?

    // MARK: - Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Configure Components
    private func configureUI() {

    }
}

/// Implement the requirement of protocol
extension HomeSceneViewController: HomeSceneViewControllerInput {

}
