//
//  DetailViewController.swift
//  DdayCalendar
//
//  Created by 이중엽 on 2023/03/13.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var mainDatePicker: UIDatePicker!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mainTextView: UITextView!
    
    var newDday: Dday?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBarButtonItem()
    }

    func setBarButtonItem() {
        let saveBarButtonItem = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(saveButtonClicked))
        self.navigationItem.rightBarButtonItem = saveBarButtonItem
    }
    
    @objc func saveButtonClicked() {
        // 1. 데이터 저장
        let date = mainDatePicker.date
        let title = nameTextField.text!
        var memo: String?
        
        if !mainTextView.text.isEmpty {
            memo = mainTextView.text
        }
        
        if let memo = memo {
            newDday = Dday(date: date, title: title, memo: memo)
        } else {
            newDday = Dday(date: date, title: title)
        }
        
        if let newDday = newDday {
            DataStorage.ddayList.append(newDday)
        }

        self.navigationController?.popViewController(animated: true)
    }
}
