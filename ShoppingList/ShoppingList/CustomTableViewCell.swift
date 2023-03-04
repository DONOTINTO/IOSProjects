//
//  customTableViewCell.swift
//  ShoppingList
//
//  Created by 이중엽 on 2023/03/04.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        checkButton.isSelected.toggle()
    }
}
