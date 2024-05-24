//
//  TodoService.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation

final class TodoService {
    private let container: any Container<Todo>
    
    init(container: any Container<Todo>) {
        self.container = container
    }
    
    func readAll() async -> [Todo] {
        do {
            let todos = try await container.readAll()
            return todos
        } catch {
            debugPrint(#function, "error: \(error.localizedDescription)")
            return []
        }
    }
    
    func write(with todo: Todo) async {
        do {
            try await container.write(with: todo)
        } catch {
            debugPrint(#function, "error: \(error.localizedDescription)")
        }
    }
}
