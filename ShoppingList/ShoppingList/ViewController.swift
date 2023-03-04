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
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.mainTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        return cell
    }
    
    
}
