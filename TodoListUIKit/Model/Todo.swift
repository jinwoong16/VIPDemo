//
//  Todo.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation
import SwiftData

@Model
final class Todo: Hashable {
    var id: UUID
    var completed: Bool
    var body: String
    let created: Date
    let dueDate: Date?
    
    init(
        id: UUID = UUID(),
        completed: Bool,
        description: String,
        created: Date = Date(),
        dueDate: Date? = nil
    ) {
        self.id = id
        self.completed = completed
        self.body = description
        self.created = created
        self.dueDate = dueDate
    }
    
    static func == (lhs: Todo, rhs: Todo) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(self))
    }
}
