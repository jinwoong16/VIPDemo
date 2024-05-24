// 
//  HomeSceneRouter.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import UIKit

protocol HomeSceneRouterLogic {
    func showAddTodoScene(from source: UIViewController)
}

final class DefaultHomeSceneRouter: HomeSceneRouterLogic {
    func showAddTodoScene(from source: UIViewController) {
        let viewController = DefaultSceneFactory.makeAddTodoScene(with: DefaultAddTodoSceneConfigurator())
        let navigationViewController = UINavigationController(rootViewController: viewController)
        source.present(navigationViewController, animated: true)
    }
}
