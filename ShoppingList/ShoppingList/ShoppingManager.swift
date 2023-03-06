//
//  ShoppingList.swift
//  ShoppingList
//
//  Created by 이중엽 on 2023/03/04.
//

import UIKit

class ShoppingManager {
    private init() {}
    static let shared = ShoppingManager()
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
    
    func update(name: String, index: Int) {
        shoppingList[index].name = name
    }
    
    func update(isChecked: Bool, index: Int) {
        shoppingList[index].check = isChecked
    }
    
    func remove(index: Int) {
        shoppingList.remove(at: index)
    }
    
    func count() -> Int {
        return shoppingList.count
    }
    
    func getShoppingItem(index: Int) -> ShoppingListItem {
        return shoppingList[index]
    }
    
    func highToLow() {
        print("내림차순")
    }
    
    func lowToHigh() {
        print("오름차순")
    }
}
