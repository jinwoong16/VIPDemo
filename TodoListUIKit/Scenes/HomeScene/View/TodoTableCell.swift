//
//  TodoTableCell.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import UIKit

final class TodoTableCell: UITableViewCell {
    static let reuseableIdentifier = "TodoTableCell"
    
    private lazy var completeButton: UIButton = {
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(systemName: "circle")
        
        return UIButton(configuration: configuration)
    }()
    
    private lazy var todoDescription: UILabel = {
        let todoDescription = UILabel()
        todoDescription.text = ""
        
        return todoDescription
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        contentView.addSubview(completeButton)
        contentView.addSubview(todoDescription)
        
        completeButton.translatesAutoresizingMaskIntoConstraints = false
        todoDescription.translatesAutoresizingMaskIntoConstraints = false
        
        let margin = contentView.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            completeButton.topAnchor.constraint(equalTo: margin.topAnchor),
            completeButton.leadingAnchor.constraint(equalTo: margin.leadingAnchor),
            completeButton.bottomAnchor.constraint(equalTo: margin.bottomAnchor),
            
            todoDescription.topAnchor.constraint(equalTo: margin.topAnchor),
            todoDescription.leadingAnchor.constraint(equalTo: completeButton.trailingAnchor),
            todoDescription.bottomAnchor.constraint(equalTo: margin.bottomAnchor)
        ])
    }
    
    func setup(with todo: Todo) {
        if todo.completed {
            completeButton.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
            todoDescription.attributedText = todo.body.toggleStrikeThrough(with: .complete)
        } else {
            completeButton.setImage(UIImage(systemName: "circle"), for: .normal)
            todoDescription.attributedText = todo.body.toggleStrikeThrough(with: .incomplete)
        }
        
    }
}
