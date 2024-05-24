//
//  String+.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import UIKit

extension String {
    enum AttributedOption {
        case complete
        case incomplete
    }
    
    func toggleStrikeThrough(with option: AttributedOption) -> NSMutableAttributedString {
        var attributes: [NSAttributedString.Key: Any] = [:]
        
        switch option {
            case .complete:
                attributes[.strikethroughStyle] = NSUnderlineStyle.single.rawValue
                attributes[.foregroundColor] = UIColor.gray
                break
            case .incomplete:
                attributes[.strikethroughStyle] = nil
                attributes[.foregroundColor] = UIColor.black
                break
        }
        
        return NSMutableAttributedString(string: self, attributes: attributes)
    }
}
