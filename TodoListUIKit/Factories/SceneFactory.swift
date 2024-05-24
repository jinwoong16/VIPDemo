//
//  SceneFactory.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import UIKit

protocol SceneFactory {
    static func makeHomeScene(with configurator: any HomeSceneConfigurator) -> UIViewController
    static func makeAddTodoScene(with configurator: any AddTodoSceneConfigurator) -> UIViewController
}

final class DefaultSceneFactory: SceneFactory {
    static func makeHomeScene(with configurator: any HomeSceneConfigurator) -> UIViewController {
        return configurator.configure(HomeSceneViewController())
    }
    
    static func makeAddTodoScene(with configurator: any AddTodoSceneConfigurator) -> UIViewController {
        return configurator.configure(AddTodoSceneViewController())
    }
}
