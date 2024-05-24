// 
//  AddTodoSceneInteractor.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation

typealias AddTodoSceneInteractorInput = AddTodoSceneViewControllerOutput

protocol AddTodoSceneInteractorOutput: AnyObject {

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
    
}