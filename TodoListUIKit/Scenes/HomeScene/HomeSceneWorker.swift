// 
//  HomeSceneWorker.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation
import Combine

protocol HomeSceneWorkerLogic {
    func fetch() async -> [Todo]
    func receiveEvent() -> AnyPublisher<Todo, Never>
}

final class HomeSceneWorker: HomeSceneWorkerLogic {
    private let service: TodoService
    
    init(service: TodoService) {
        self.service = service
    }
    
    func fetch() async -> [Todo] {
        await service.readAll()
    }
    
    func receiveEvent() -> AnyPublisher<Todo, Never> {
        NotificationCenter.default
            .publisher(for: TodoNotification.todoDidAppend.notification)
            .compactMap { $0.object as? Todo }
            .eraseToAnyPublisher()
    }
}
