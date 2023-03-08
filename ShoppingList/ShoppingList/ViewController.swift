//
//  ViewController.swift
//  ShoppingList
//
//  Created by 이중엽 on 2023/03/04.
//

import UIKit

enum ButtonType {
    case add
    case update
}

class ViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var mainTextField: UITextField!
    @IBOutlet weak var mainTableView: UITableView!
    
    var buttonType = ButtonType.add
    var itemSection: Int?
    var itemRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        guard let name = mainTextField.text else { return }
        
        if buttonType == .add {
            // 추가할 시 uncheckedList로 추가됨
            ShoppingManager.shared.append(name: name)
        } else if buttonType == .update && itemRow != nil {
            // check uncheck 섹션 구분
            // 해당 section 및 해당 row에 해당하는 데이터 수정
            guard let section = itemSection else { return }
            guard let row = itemRow else { return }
            ShoppingManager.shared.update(name: name, section: section, row: row)
            addButton.setTitle("저장", for: .normal)
        }
        buttonType = .add
        mainTextField.text = nil
        mainTableView.reloadData()
    }
    
    @IBAction func checkButtonClicked(_ sender: CheckButton) {
        guard let row = sender.row else { return }
        guard let section = sender.section else { return }
        guard let shoppingListItem = ShoppingManager.shared.getShoppingItem(section: section, row: row) else { return }
        
        shoppingListItem.check.toggle()
        ShoppingManager.shared.update(isChecked: shoppingListItem.check, section: section, row: row)
        mainTableView.reloadData()
    }
    
    @IBAction func sortButtonClicked(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "정렬 방식", message: "", preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        let descending = UIAlertAction(title: "내림차순", style: .default, handler: { _ in
            ShoppingManager.shared.highToLow()
            self.mainTableView.reloadData()
        })
        let ascending = UIAlertAction(title: "오름차순", style: .default, handler: { _ in
            ShoppingManager.shared.lowToHigh()
            self.mainTableView.reloadData()
        })
        alert.addAction(cancel)
        alert.addAction(descending)
        alert.addAction(ascending)
        self.present(alert, animated: true)
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        ShoppingManager.shared.sectionList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        ShoppingManager.shared.sectionList[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppingManager.shared.count(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.mainTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let item = ShoppingManager.shared.getShoppingItem(section: indexPath.section, row: indexPath.row)
        cell.checkButton.section = indexPath.section
        cell.checkButton.row = indexPath.row
        cell.mainLabel.text = item?.name
        cell.configure(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = ShoppingManager.shared.getShoppingItem(section: indexPath.section, row: indexPath.row)
        itemSection = indexPath.section
        itemRow = indexPath.row
        buttonType = .update
        mainTextField.text = item?.name
        addButton.setTitle("수정", for: .normal)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ShoppingManager.shared.remove(section: indexPath.section, row: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
