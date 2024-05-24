// 
//  AddTodoSceneWorker.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation
import Combine

protocol AddTodoSceneWorkerLogic {
    func createTodo(with body: String) async
}

final class AddTodoSceneWorker: AddTodoSceneWorkerLogic {
    private let service: TodoService
    
    init(service: TodoService) {
        self.service = service
    }
    
    func createTodo(with body: String) async {
        let todo = Todo(completed: false, description: body)
        
        await service.write(with: todo)
        
        post(TodoNotification.todoDidAppend.notification, object: todo)
    }
    
    private func post<T>(_ event: Notification.Name, object: T) {
        NotificationCenter.default.post(
            name: event,
            object: object
        )
    }
}
