// 
//  HomeSceneInteractor.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation
import Combine

typealias HomeSceneInteractorInput = HomeSceneViewControllerOutput

protocol HomeSceneInteractorOutput: AnyObject {
    func present(with response: HomeSceneModel.Fetch.Response)
    func present(with response: HomeSceneModel.FetchAll.Response)
}

final class HomeSceneInteractor {
    private let presenter: HomeScenePresenterInput
    private let worker: HomeSceneWorkerLogic
    private var disposableBag = Set<AnyCancellable>()

    init(
        presenter: HomeScenePresenterInput, 
        worker: HomeSceneWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
        
        receiveEvent()
    }
    
    func receiveEvent() {
        worker
            .receiveEvent()
            .sink { [weak self] todo in
                self?.presenter.present(with: .init(todo: todo))
            }
            .store(in: &disposableBag)
    }
}

extension HomeSceneInteractor: HomeSceneInteractorInput {
    func tapAddTodoButton() {
        let random = Int.random(in: 0..<10)
        let todo = Todo(completed: false, description: "\(random)")
        
        presenter.present(with: .init(todo: todo))
    }
    
    func viewDidLoad() {
        Task { [weak self] in
            let todos = await self?.worker.fetch()
            self?.presenter.present(with: .init(todos: todos ?? []))
        }
    }
}
