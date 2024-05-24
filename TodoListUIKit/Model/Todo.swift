//
//  Todo.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation

final class Todo: Hashable {
    var id: UUID
    var completed: Bool
    var body: String
    let created: Date
    
    init(
        id: UUID = UUID(),
        completed: Bool,
        description: String,
        created: Date = Date()
    ) {
        self.id = id
        self.completed = completed
        self.body = description
        self.created = created
    }
    
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
