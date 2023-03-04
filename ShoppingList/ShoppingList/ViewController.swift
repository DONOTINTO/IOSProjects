//
//  ViewController.swift
//  ShoppingList
//
//  Created by 이중엽 on 2023/03/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var mainTextField: UITextField!
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        
    }
    
    @IBAction func addButtonClicked(_ sender: UIButton) {
        guard let name = mainTextField.text else { return }
        shoppingManager.shared.append(name: name)
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
    
}
