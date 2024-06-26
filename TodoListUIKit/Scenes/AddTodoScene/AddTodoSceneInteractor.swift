// 
//  AddTodoSceneInteractor.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation

typealias AddTodoSceneInteractorInput = AddTodoSceneViewControllerOutput

protocol AddTodoSceneInteractorOutput: AnyObject {
    func dismiss()
    func rejectRequest(_ response: AddTodoSceneModel.AddTodo.Response)
}

final class AddTodoSceneInteractor {
    private let presenter: AddTodoScenePresenterInput
    private let worker: AddTodoSceneWorkerLogic

    init(
        presenter: AddTodoScenePresenterInput, 
        worker: AddTodoSceneWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension AddTodoSceneInteractor: AddTodoSceneInteractorInput {
    func tapAddButton(_ request: AddTodoSceneModel.AddTodo.Request) {
        if request.body.isEmpty {
            presenter.rejectRequest(.init(reason: .emptyBody))
            return
        }
        
        Task { [weak self] in
            await self?.worker.createTodo(with: request.body)
            
            self?.presenter.dismiss()
        }
    }
}
