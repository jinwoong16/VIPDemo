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
}
