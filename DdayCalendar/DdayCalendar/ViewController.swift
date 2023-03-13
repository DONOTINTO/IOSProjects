//
//  ViewController.swift
//  DdayCalendar
//
//  Created by 이중엽 on 2023/03/13.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ddayTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ddayTableView.delegate = self
        ddayTableView.dataSource = self
    }

    @IBAction func addButtonClicked(_ sender: Any) {
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as? DetailViewController else { return }
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func editButtonClicked(_ sender: Any) {
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStorage.ddayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        let item = DataStorage.ddayList[indexPath.row]
        cell.cellImageView.image = item.thumbnail ?? UIImage(systemName: "pencil")
        cell.dateLabel.text = "\(item.date)"
        cell.dDayLabel.text = "-"
        cell.memoLabel.text = item.memo ?? "메모 없음"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
