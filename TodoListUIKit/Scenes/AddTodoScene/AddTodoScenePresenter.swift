// 
//  AddTodoScenePresenter.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation

typealias AddTodoScenePresenterInput = AddTodoSceneInteractorOutput
typealias AddTodoScenePresenterOutput = AddTodoSceneViewControllerInput

final class AddTodoScenePresenter {
    private weak var viewController: AddTodoScenePresenterOutput?

    init(viewController: AddTodoScenePresenterOutput? = nil) {
        self.viewController = viewController
    }
}

extension AddTodoScenePresenter: AddTodoScenePresenterInput {
    func dismiss() {
        viewController?.dismiss()
    }
    
    func rejectRequest(_ response: AddTodoSceneModel.AddTodo.Response) {
        switch response.reason {
            case .emptyBody:
                viewController?.showAlert(with: response.reason.description)
        }
    }
}
