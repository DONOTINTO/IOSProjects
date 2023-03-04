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
    
    private var shoppingList: [ShoppingListItem] = []
    
    class ShoppingListItem {
        fileprivate init(name: String) {
            self.name = name
            self.check = false
        }
        
        var name: String
        var check: Bool
    }
    
    func append(name: String) {
        let shoppingItem = ShoppingListItem(name: name)
        shoppingList.append(shoppingItem)
    }
    
    func count() -> Int {
        return shoppingList.count
    }
    
    func getShoppingItem(index: Int) -> ShoppingListItem {
        return shoppingList[index]
    }
}
