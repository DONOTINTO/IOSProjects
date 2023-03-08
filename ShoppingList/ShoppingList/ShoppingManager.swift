//
//  ShoppingList.swift
//  ShoppingList
//
//  Created by 이중엽 on 2023/03/04.
//

import UIKit

enum CheckEnum: Int {
    case checked
    case unchecked
}

class ShoppingManager {
    private init() {}
    static let shared = ShoppingManager()
    
    var sectionList = ["체크", "미체크"]
    var checkedList: [ShoppingListItem] = []
    var uncheckedList: [ShoppingListItem] = []
    
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
        uncheckedList.append(shoppingItem)
    }
    
    func update(name: String, section: Int, row: Int) {
        let checkState = CheckEnum(rawValue: section)
        
        switch checkState {
        case .checked: checkedList[row].name = name
        case .unchecked: uncheckedList[row].name = name
        default: return
        }
    }
    
    func update(isChecked: Bool, section: Int, row: Int) {
        let checkState = CheckEnum(rawValue: section)
        
        switch checkState {
        case .checked:
            checkedList[row].check = isChecked
            
            let item = checkedList[row]
            checkedList.remove(at: row)
            uncheckedList.append(item)
        case .unchecked:
            uncheckedList[row].check = isChecked
            
            let item = uncheckedList[row]
            uncheckedList.remove(at: row)
            checkedList.append(item)
        default: return
        }
    }
    
    func remove(section: Int, row: Int) {
        let checkState = CheckEnum(rawValue: section)
        
        switch checkState {
        case .checked: checkedList.remove(at: row)
        case .unchecked: uncheckedList.remove(at: row)
        default: return
        }
    }
    
    func count(section: Int) -> Int {
        let checkState = CheckEnum(rawValue: section)
        
        switch checkState {
        case .checked: return checkedList.count
        case .unchecked: return uncheckedList.count
        default: return 0
        }
    }
    
    func getShoppingItem(section: Int, row: Int) -> ShoppingListItem? {
        let checkState = CheckEnum(rawValue: section)
        
        switch checkState {
        case .checked: return checkedList[row]
        case .unchecked: return uncheckedList[row]
        default: return nil
        }
    }
    
    func highToLow() {
        // filter -> 체크 / 미체크 분리
        // 각 배열을 정렬
        // 미체크 배열 + 체크된 배열
        // let checkedList = shoppingList.filter { $0.check }.sorted { $0.name > $1.name }
        // let unCheckedList = shoppingList.filter { !$0.check }.sorted { $0.name > $1.name }
        // shoppingList = unCheckedList + checkedList
        checkedList.sort { $0.name > $1.name }
        uncheckedList.sort { $0.name > $1.name }
    }
    
    func lowToHigh() {
        // let checkedList = shoppingList.filter { $0.check }.sorted { $0.name < $1.name }
        // let unCheckedList = shoppingList.filter { !$0.check }.sorted { $0.name < $1.name }
        // shoppingList = unCheckedList + checkedList
        checkedList.sort { $0.name < $1.name }
        uncheckedList.sort { $0.name < $1.name }
    }
}
