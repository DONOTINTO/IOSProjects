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
    
    func update(name: String, section: Int, index: Int) {
        let checkState = CheckEnum(rawValue: section)
        
        switch checkState {
        case .checked: checkedList[index].name = name
        case .unchecked: uncheckedList[index].name = name
        default: return
        }
    }
    
    func update(isChecked: Bool, section: Int, index: Int) {
        let checkState = CheckEnum(rawValue: section)
        
        switch checkState {
        case .checked:
            checkedList[index].check = isChecked
            
            let item = checkedList[index]
            checkedList.remove(at: index)
            uncheckedList.append(item)
        case .unchecked:
            uncheckedList[index].check = isChecked
            
            print("section: \(section)")
            print("row: \(index)")
            let item = uncheckedList[index]
            uncheckedList.remove(at: index)
            checkedList.append(item)
        default: return
        }
    }
    
    func remove(section: Int, index: Int) {
        let checkState = CheckEnum(rawValue: section)
        
        switch checkState {
        case .checked: checkedList.remove(at: index)
        case .unchecked: uncheckedList.remove(at: index)
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
    
    func getShoppingItem(section: Int, index: Int) -> ShoppingListItem? {
        let checkState = CheckEnum(rawValue: section)
        
        switch checkState {
        case .checked: return checkedList[index]
        case .unchecked: return uncheckedList[index]
        default: return nil
        }
    }
    
    func highToLow() {
        // filter -> 체크 / 미체크 분리
        // 각 배열을 정렬
        // 미체크 배열 + 체크된 배열
//        let checkedList = shoppingList.filter { $0.check }.sorted { $0.name > $1.name }
//        let unCheckedList = shoppingList.filter { !$0.check }.sorted { $0.name > $1.name }
//        shoppingList = unCheckedList + checkedList
        checkedList.sort { $0.name > $1.name }
        uncheckedList.sort { $0.name > $1.name }
    }
    
    func lowToHigh() {
//        let checkedList = shoppingList.filter { $0.check }.sorted { $0.name < $1.name }
//        let unCheckedList = shoppingList.filter { !$0.check }.sorted { $0.name < $1.name }
//        shoppingList = unCheckedList + checkedList
        checkedList.sort { $0.name < $1.name }
        uncheckedList.sort { $0.name < $1.name }
    }
}
