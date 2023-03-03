//
//  SecondViewController.swift
//  Study_2_self
//
//  Created by 이중엽 on 2023/03/02.
//

import UIKit

protocol SendActionDelegate {
    func reload()
}

enum ViewType {
    case add
    case update
}

class SecondViewController: UIViewController {
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var imageName: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    
    var symbol: Symbol?
    var index: Int?
    var viewType: ViewType = .add
    var isCheck = false
    var delegate: SendActionDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inputTextField.delegate = self
        setUpInitialData()
    }

    func setUpInitialData() {
        if viewType == .add {
            image.image = nil
            imageName.text = ""
            updateButton.setTitle("저장", for: .normal)
        } else {
            image.image = symbol?.image
            imageName.text = symbol?.name
            updateButton.setTitle("수정", for: .normal)
        }
        
        updateButton.isEnabled = false
    }
    
    @IBAction func checkButtonClicked(_ sender: UIButton) {
        if inputTextField.text == "" {
            showAlert(title: "빈칸", message: "입력된 값이 없습니다.")
            return
        }
        
        guard let myImage = UIImage(systemName: inputTextField.text!) else {
            showAlert(title: "오류", message: "해당 이름으로 된 이미지가 존재하지 않습니다.")
            return
        }
        
        image.image = myImage
        imageName.text = inputTextField.text!
        updateButton.isEnabled = true
    }
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        let newSymbolImage = UIImage(systemName: inputTextField.text!)!
        let newSymbolName = inputTextField.text!
        let newSymbol = Symbol(image: newSymbolImage, name: newSymbolName)
        
        // 중복확인
        if SymbolManager.shared.isExist(newSymbol) {
            showAlert(title: "중복", message: "이미 존재하는 이미지 입니다. 새로운 이미지를 추가해보세요!")
            return
        }
        
        // 저장
        if viewType == .add {
            SymbolManager.shared.append(newSymbol)
        } else {
            SymbolManager.shared.update(newSymbol, index: index!)
        }
        
        // 화면 다시 그리기 (delegate 패턴 적용)
        delegate?.reload()
        self.navigationController?.popViewController(animated: true)
    }
}

extension SecondViewController: UITextFieldDelegate {
    // 입력을 받을때마다 체크함
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        updateButton.isEnabled = false
        return true
    }
    
    // 엔터키를 입력받으면 미리보기 액션 실행
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkButtonClicked(checkButton)
        return true
    }
}
