//
//  customTableViewCell.swift
//  ShoppingList
//
//  Created by 이중엽 on 2023/03/04.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var checkButton: CheckButton!
    
    func configure(index: Int) {
        guard let section = checkButton.section else { return }
        guard let row = checkButton.row else { return }
        guard let item = ShoppingManager.shared.getShoppingItem(section: section, row: row) else { return }
        checkButton.isSelected = item.check
    }
}
