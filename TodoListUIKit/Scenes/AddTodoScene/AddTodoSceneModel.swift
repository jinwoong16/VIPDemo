//
//  AddTodoSceneModel.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation

enum AddTodoSceneModel {
    enum AddTodo {
        struct Request {
            let body: String
        }
        struct Response {
            let reason: RejectReason
        }
        struct ViewModel {
            let alertMessage: String
        }
        
        enum RejectReason {
            case emptyBody
            
            var description: String {
                switch self {
                    case .emptyBody:
                        return "Empty body is now allowed."
                }
            }
        }
    }
}
