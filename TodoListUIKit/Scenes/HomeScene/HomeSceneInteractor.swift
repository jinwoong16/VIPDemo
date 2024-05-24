// 
//  HomeSceneInteractor.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation

typealias HomeSceneInteractorInput = HomeSceneViewControllerOutput

protocol HomeSceneInteractorOutput: AnyObject {
    func present(with response: HomeSceneModel.Fetch.Response)
}

final class HomeSceneInteractor {
    private let presenter: HomeScenePresenterInput
    private let worker: HomeSceneWorkerLogic

    init(
        presenter: HomeScenePresenterInput, 
        worker: HomeSceneWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension HomeSceneInteractor: HomeSceneInteractorInput {
    func tapAddTodoButton() {
        let random = Int.random(in: 0..<10)
        let todo = Todo(completed: false, description: "\(random)")
        
        presenter.present(with: .init(todo: todo))
    }
}
