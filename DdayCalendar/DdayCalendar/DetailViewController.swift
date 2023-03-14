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
        let curDate         = Date()
        let selectedDate    = mainDatePicker.date
        let title           = nameTextField.text!
        var memo: String?

        if !mainTextView.text.isEmpty {
            memo = mainTextView.text
        }
        
        if let memo = memo {
            newDday = Dday(curDate: curDate, selectedDate: selectedDate, title: title, memo: memo)
        } else {
            newDday = Dday(curDate: curDate, selectedDate: selectedDate, title: title)
        }

        if let newDday = newDday {
            DataStorage.ddayList.append(newDday)
        }

        self.navigationController?.popViewController(animated: true)
    }
}
