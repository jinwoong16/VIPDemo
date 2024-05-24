// 
//  HomeSceneInteractor.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation

typealias HomeSceneInteractorInput = HomeSceneViewControllerOutput

protocol HomeSceneInteractorOutput: AnyObject {

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
    
}