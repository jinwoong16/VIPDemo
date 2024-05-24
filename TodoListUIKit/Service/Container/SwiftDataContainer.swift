//
//  SwiftDataContainer.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation
import SwiftData

@ModelActor
actor SwiftDataContainer {
    private func fetch<T>(_ descriptor: FetchDescriptor<T>) throws -> [T] where T: PersistentModel {
        try self.modelContext.fetch(descriptor)
    }
    
    private func insert<T>(data: T) where T: PersistentModel {
        let context = data.modelContext ?? modelContext
        context.insert(data)
    }
    
    private func remove<T>(data: T) where T: PersistentModel {
        self.modelContext.delete(data)
    }
}

extension SwiftDataContainer: Container {
    func readAll() async throws -> [Todo] {
        try fetch(FetchDescriptor<Todo>())
    }
    
    func write(with element: Todo) async throws {
        insert(data: element)
    }
    
    func delete(data: Todo) async {
        remove(data: data)
    }
}
