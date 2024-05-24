// 
//  AddTodoSceneConfigurator.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation

protocol AddTodoSceneConfigurator {
    func configure(_ viewController: AddTodoSceneViewController, service: TodoService) -> AddTodoSceneViewController
}

final class DefaultAddTodoSceneConfigurator: AddTodoSceneConfigurator {
     func configure(_ viewController: AddTodoSceneViewController, service: TodoService) -> AddTodoSceneViewController {
         let worker = AddTodoSceneWorker(service: service)
         let presenter = AddTodoScenePresenter(viewController: viewController)
         let interactor = AddTodoSceneInteractor(presenter: presenter, worker: worker)

         viewController.interactor = interactor
         viewController.router = DefaultAddTodoSceneRouter()

         return viewController
     }
}
