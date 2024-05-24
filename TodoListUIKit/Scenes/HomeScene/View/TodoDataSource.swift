//
//  TodoDataSource.swift
//  TodoListUIKit
//
//  Created by jinwoong Kim on 5/24/24.
//

import UIKit

final class TodoDataSource: UITableViewDiffableDataSource<Int, Todo> {
    init(tableView: UITableView) {
        super.init(tableView: tableView) { tableView, indexPath, itemIdentifier in
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: TodoTableCell.reuseableIdentifier,
                for: indexPath
            ) as? TodoTableCell else {
                return UITableViewCell()
            }
            cell.setup(with: itemIdentifier)
            cell.selectionStyle = .none
            
            return cell
        }
    }
}
