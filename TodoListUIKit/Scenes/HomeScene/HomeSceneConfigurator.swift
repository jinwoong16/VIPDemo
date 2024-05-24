// 
//  HomeSceneConfigurator.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation

protocol HomeSceneConfigurator {
     func configure(_ viewController: HomeSceneViewController) -> HomeSceneViewController
}

final class DefaultHomeSceneConfigurator: HomeSceneConfigurator {
     func configure(_ viewController: HomeSceneViewController) -> HomeSceneViewController {
         let worker = HomeSceneWorker()
         let presenter = HomeScenePresenter(viewController: viewController)
         let interactor = HomeSceneInteractor(presenter: presenter, worker: worker)

         viewController.interactor = interactor
         viewController.router = DefaultHomeSceneRouter()

         return viewController
     }
}
