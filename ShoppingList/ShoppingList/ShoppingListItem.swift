//
//  ShoppingList.swift
//  ShoppingList
//
//  Created by 이중엽 on 2023/03/04.
//

import UIKit

class shoppingManager {
 
    private init() {}
    
    static let shared = shoppingManager()
    var shoppingList: [ShoppingListItem] = []
    
    class ShoppingListItem {
        private init(name: String) {
            self.name = name
            self.check = false
        }
        
        var name: String
        var check: Bool
    }
    
    
}
