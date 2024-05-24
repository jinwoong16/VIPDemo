//
//  SceneFactory.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import UIKit

protocol SceneFactory {
    static func makeHomeScene(with configurator: any HomeSceneConfigurator) -> UIViewController
}

final class DefaultSceneFactory: SceneFactory {
    static func makeHomeScene(with configurator: any HomeSceneConfigurator) -> UIViewController {
        return configurator.configure(HomeSceneViewController())
    }
}
