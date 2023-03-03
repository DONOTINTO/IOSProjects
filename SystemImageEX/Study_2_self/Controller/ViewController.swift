//
//  ViewController.swift
//  Study_2_self
//
//  Created by 이중엽 on 2023/03/02.
//

import UIKit

extension UIViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(okButton)
        present(alert, animated: true)
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var mainTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }

    @IBAction func nextVCButtonClicked(_ sender: UIBarButtonItem) {
        guard let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else { return }
        secondVC.delegate = self
        secondVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

//MARK: - extention
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SymbolManager.shared.count()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as? mainTableViewCell else { return UITableViewCell() }
        
        let symbol = SymbolManager.shared.getSymbol(index: indexPath.row)
        cell.mainImage.image = symbol.image
        cell.mainLabel.text = symbol.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController else { return }
        secondVC.delegate = self
        secondVC.viewType = .update
        secondVC.symbol = SymbolManager.shared.getSymbol(index: indexPath.row)
        secondVC.index = indexPath.row
        secondVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "주의", message: "삭제하시겠습니까?", preferredStyle: .alert)
            let deleteAction = UIAlertAction(title: "삭제", style: .destructive) { action in
                SymbolManager.shared.remove(index: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                tableView.reloadData()
            }
            let cancelAction = UIAlertAction(title: "취소", style: .cancel)
            alert.addAction(deleteAction)
            alert.addAction(cancelAction)
            present(alert, animated: true)
        }
    }
}

extension ViewController: SendActionDelegate {
    func reload() {
        mainTableView.reloadData()
    }
}
