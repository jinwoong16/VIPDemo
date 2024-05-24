//
//  Container.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation

protocol Container<Element> {
    associatedtype Element
    func readAll() async throws -> [Element]
    func write(with element: Element) async throws
    func delete(data: Element) async
}
