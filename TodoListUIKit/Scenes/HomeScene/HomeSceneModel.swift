//
//  HomeSceneModel.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation

enum HomeSceneModel {
    enum Fetch {
        struct Request {
            
        }
        struct Response {
            let todo: Todo
        }
        struct ViewModel {
            let todo: Todo
        }
    }
    
    enum FetchAll {
        struct Request {
            
        }
        struct Response {
            let todos: [Todo]
        }
        struct ViewModel {
            let todos: [Todo]
        }
    }
}
