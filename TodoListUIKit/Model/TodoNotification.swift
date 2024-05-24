//
//  TodoNotification.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import Foundation

enum TodoNotification: String {
    case todoDidAppend
    
    var notification: Notification.Name {
        Notification.Name(rawValue: self.rawValue)
    }
}
