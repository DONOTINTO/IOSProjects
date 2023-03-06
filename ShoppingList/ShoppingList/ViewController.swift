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
    @IBOutlet weak var checkButton: UIButton!
    var buttonType = ButtonType.add
    var itemIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        guard let name = mainTextField.text else { return }
        
        if buttonType == .add {
            ShoppingManager.shared.append(name: name)
        } else if buttonType == .update && itemIndex != nil {
            ShoppingManager.shared.update(name: name, index: itemIndex!)
            addButton.setTitle("저장", for: .normal)
        }
        
        buttonType = .add
        mainTextField.text = nil
        mainTableView.reloadData()
    }
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        let index = sender.tag
        let shoppingListItem = ShoppingManager.shared.getShoppingItem(index: index)
        
        shoppingListItem.check.toggle()
        ShoppingManager.shared.update(isChecked: shoppingListItem.check, index: index)
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ShoppingManager.shared.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.mainTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        cell.checkButton.tag = indexPath.row
        let item = ShoppingManager.shared.getShoppingItem(index: indexPath.row)
        cell.mainLabel.text = item.name
        cell.configure(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = ShoppingManager.shared.getShoppingItem(index: indexPath.row)
        itemIndex = indexPath.row
        buttonType = .update
        mainTextField.text = item.name
        addButton.setTitle("수정", for: .normal)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ShoppingManager.shared.remove(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
