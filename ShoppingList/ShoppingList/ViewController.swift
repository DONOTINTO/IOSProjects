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
    var itemIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        guard let name = mainTextField.text else { return }
        
        if buttonType == .add {
            shoppingManager.shared.append(name: name)
        } else if buttonType == .update && itemIndex != nil {
            shoppingManager.shared.update(name: name, index: itemIndex!)
            addButton.setTitle("저장", for: .normal)
        }
        
        buttonType = .add
        mainTextField.text = nil
        mainTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingManager.shared.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.mainTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let item = shoppingManager.shared.getShoppingItem(index: indexPath.row)
        cell.mainLabel.text = item.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = shoppingManager.shared.getShoppingItem(index: indexPath.row)
        itemIndex = indexPath.row
        buttonType = .update
        mainTextField.text = item.name
        addButton.setTitle("수정", for: .normal)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .automatic)
            shoppingManager.shared.remove(index: indexPath.row)
        }
    }
}
