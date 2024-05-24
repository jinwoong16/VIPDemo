//
//  SceneFactory.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import UIKit
import SwiftData

protocol SceneFactory {
    static func makeHomeScene(with configurator: any HomeSceneConfigurator) -> UIViewController
    static func makeAddTodoScene(with configurator: any AddTodoSceneConfigurator) -> UIViewController
}

final class DefaultSceneFactory: SceneFactory {
    private static var todoService: TodoService = {
        do {
            let container = try ModelContainer(
                for: Todo.self,
                configurations: ModelConfiguration()
            )
            return TodoService(container: SwiftDataContainer(modelContainer: container))
        } catch {
            fatalError()
        }
    }()
    
    static func makeHomeScene(with configurator: any HomeSceneConfigurator) -> UIViewController {
        return configurator.configure(HomeSceneViewController(), service: todoService)
    }
    
    static func makeAddTodoScene(with configurator: any AddTodoSceneConfigurator) -> UIViewController {
        return configurator.configure(AddTodoSceneViewController(), service: todoService)
    }
}
