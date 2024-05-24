// 
//  HomeScenePresenter.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation

typealias HomeScenePresenterInput = HomeSceneInteractorOutput
typealias HomeScenePresenterOutput = HomeSceneViewControllerInput

final class HomeScenePresenter {
    private weak var viewController: HomeScenePresenterOutput?

    init(viewController: HomeScenePresenterOutput? = nil) {
        self.viewController = viewController
    }
}

extension HomeScenePresenter: HomeScenePresenterInput {
    func present(with response: HomeSceneModel.Fetch.Response) {
        viewController?.showTodo(.init(todo: response.todo))
    }
}
