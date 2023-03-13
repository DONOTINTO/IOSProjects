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
        
        // 2. 화면 전환
        self.navigationController?.popViewController(animated: true)
        
        // 3.
    }
}
