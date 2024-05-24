// 
//  HomeSceneWorker.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation
import Combine

protocol HomeSceneWorkerLogic {
    func fetch() async
    func receiveEvent() -> AnyPublisher<Todo, Never>
}

final class HomeSceneWorker: HomeSceneWorkerLogic {
//    private let databaseService ...
    
    func fetch() async {
        // fetch from db
    }
    
    func receiveEvent() -> AnyPublisher<Todo, Never> {
        NotificationCenter.default
            .publisher(for: TodoNotification.todoDidAppend.notification)
            .compactMap { $0.object as? Todo }
            .eraseToAnyPublisher()
    }
}
