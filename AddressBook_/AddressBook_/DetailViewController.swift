//
//  DetailViewController.swift
//  AddressBook_
//
//  Created by 이중엽 on 2023/03/11.
//

import UIKit
import SnapKit

protocol NotifyViewDiss {
    func reloadTable()
}

class DetailViewController: UIViewController {
    
    var delegate: NotifyViewDiss?
    
    let backButton          = UIButton()
    let saveButton          = UIButton()
    
    let memberImageView     = UIImageView()
    let addImageButton      = UIButton()
    
    let nameLabel           = UILabel()
    let nameTextField       = UITextField()
    let phoneLabel          = UILabel()
    let phoneTextField      = UITextField()
    
    let favoriteLabel       = UILabel()
    let yesButton           = UIButton()
    let noButton            = UIButton()
    
    let memoLabel           = UILabel()
    let memoTextView        = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addAction()
        initialSetup()
        makeUI()
    }
    
    // ********************************
    // MARK: - addAction
    // ********************************
    func addAction() {
        backButton.addTarget(self, action: #selector(backButtonClicked), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        addImageButton.addTarget(self, action: #selector(addImageButtonClicked), for: .touchUpInside)
        yesButton.addTarget(self, action: #selector(yesButtonClicked), for: .touchUpInside)
        noButton.addTarget(self, action: #selector(noButtonClicked), for: .touchUpInside)
    }
    
    // ********************************
    // MARK: - backButtonClicekd
    // ********************************
    @objc func backButtonClicked() {
        self.dismiss(animated: true)
    }

    // ********************************
    // MARK: - saveButtonClicked
    // ********************************
    @objc func saveButtonClicked() {
        // 미입력시 alert창 띄우기
        if nameTextField.text == "" {
            showAlert(title: "미입력", message: "이름을 입력해주세요")
            return
        } else if phoneTextField.text == "" {
            showAlert(title: "미입력", message: "비밀번호를 입력해주세요")
            return
        } else if yesButton.isSelected == false && noButton.isSelected == false {
            showAlert(title: "미입력", message: "즐겨찾기 여부를 선택해주세요")
        }
        
        // 새로운 멤버를 생성해서 저장
        guard let image = memberImageView.image else { return }
        guard let name  = nameTextField.text    else { return }
        guard let phone = phoneTextField.text   else { return }
        guard let memo  = memoTextView.text     else { return }
        var isFavorite  = false

        if yesButton.isSelected { isFavorite = true }
        
        MemberManger.shared.append(image: image, name: name, phoneNumber: phone, memo: memo, isFavorite: isFavorite)
        
        showAlert(title: "저장", message: "저장이 완료되었습니다", dismissPresentingView: true)
        delegate?.reloadTable()
    }
    
    // ********************************
    // MARK: - addImageButtonClicked
    // ********************************
    @objc func addImageButtonClicked() {
        
    }
    
    // ********************************
    // MARK: - yesButtonClicked
    // ********************************
    @objc func yesButtonClicked() {
        yesButton.isSelected.toggle()
        noButton.isSelected = !yesButton.isSelected
        
        yesButton.setBackgroundColor(button: yesButton, isSelected: yesButton.isSelected )
        noButton.setBackgroundColor(button: noButton, isSelected: noButton.isSelected )
    }
    
    // ********************************
    // MARK: - noButtonClicked
    // ********************************
    @objc func noButtonClicked() {
        noButton.isSelected.toggle()
        yesButton.isSelected = !noButton.isSelected
        
        yesButton.setBackgroundColor(button: yesButton, isSelected: yesButton.isSelected )
        noButton.setBackgroundColor(button: noButton, isSelected: noButton.isSelected )
    }
    
    // ********************************
    // MARK: - initialSetup
    // ********************************
    func initialSetup() {
        // 기본 배경 색깔 설정
        view.backgroundColor = .white
        
        // 기본 텍스트 설정
        backButton.setTitle("뒤로가기", for: .normal)
        saveButton.setTitle("저장", for: .normal)
        addImageButton.setTitle("사진 등록", for: .normal)
        yesButton.setTitle("YES", for: .normal)
        noButton.setTitle("NO", for: .normal)
        nameLabel.text = "Name"
        phoneLabel.text = "Phone"
        favoriteLabel.text = "Favorite"
        memoLabel.text = "memo"
        
        // 뒤로가기 버튼
        backButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        backButton.setTitleColor(.black, for: .normal)
        backButton.layer.borderWidth = 1
        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        
        // 저장 버튼
        saveButton.titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        saveButton.setTitleColor(.black, for: .normal)
        saveButton.layer.borderWidth = 1
        saveButton.clipsToBounds = true
        saveButton.layer.cornerRadius = 5
        
        // 이미지 뷰
        let testImage = UIImage(systemName: "pencil")
        memberImageView.image = testImage
        memberImageView.backgroundColor = .black
        memberImageView.clipsToBounds = true
        memberImageView.layer.cornerRadius = (view.frame.width / 2.5) / 2
        
        // 이미지 저장 버튼
        addImageButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        addImageButton.setTitleColor(.black, for: .normal)
        addImageButton.layer.borderWidth = 1
        addImageButton.layer.cornerRadius = 5
        addImageButton.clipsToBounds = true
        
        // 이름 레이블
        nameLabel.textColor = .black
        nameLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        nameLabel.textAlignment = .left
        
        // 번호 레이블
        phoneLabel.textColor = .black
        phoneLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        phoneLabel.textAlignment = .left
        
        // 이름 텍스트 필드
        nameTextField.borderStyle = .line
        nameTextField.textColor = .black
        nameTextField.font = UIFont.systemFont(ofSize: 15, weight: .light)
        nameTextField.leftView  = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0))
        nameTextField.leftViewMode = .always
        nameTextField.layer.borderWidth = 1
        nameTextField.layer.cornerRadius = 5
        nameTextField.clipsToBounds = true
        nameTextField.placeholder = "이름을 입력하세요"
        
        // 번호 텍스트 필드
        phoneTextField.borderStyle = .line
        phoneTextField.textColor = .black
        phoneTextField.font = UIFont.systemFont(ofSize: 15, weight: .light)
        phoneTextField.leftView  = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 8.0, height: 0))
        phoneTextField.leftViewMode = .always
        phoneTextField.layer.borderWidth = 1
        phoneTextField.layer.cornerRadius = 5
        phoneTextField.clipsToBounds = true
        phoneTextField.placeholder = "번호을 입력하세요"
        
        // 즐겨찾기 설정 레이블
        favoriteLabel.textColor = .black
        favoriteLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        
        // 즐겨찾기 yes 버튼
        yesButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        yesButton.setTitleColor(.black, for: .normal)
        yesButton.layer.borderWidth = 1
        yesButton.layer.cornerRadius = 5
        yesButton.clipsToBounds = true
        yesButton.isSelected = false
        
        // 즐겨찾기 no 버튼
        noButton.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        noButton.setTitleColor(.black, for: .normal)
        noButton.layer.borderWidth = 1
        noButton.layer.cornerRadius = 5
        noButton.clipsToBounds = true
        noButton.isSelected = false
        
        // 메모 레이블
        memoLabel.textColor = .black
        memoLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        memoLabel.textAlignment = .center
        
        // 메모 텍스트 뷰
        memoTextView.backgroundColor = .white
        memoTextView.textColor = .black
        memoTextView.font = UIFont.systemFont(ofSize: 15, weight: .light)
        memoTextView.textAlignment = .left
        memoTextView.layer.borderWidth = 1
        memoTextView.layer.cornerRadius = 5
        memoTextView.clipsToBounds = true
    }
    
    // ********************************
    // MARK: - makeUI
    // ********************************
    func makeUI() {
        // 뷰 추가
        view.addSubview(backButton)
        view.addSubview(saveButton)
        view.addSubview(memberImageView)
        view.addSubview(addImageButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(phoneLabel)
        view.addSubview(phoneTextField)
        view.addSubview(favoriteLabel)
        view.addSubview(yesButton)
        view.addSubview(noButton)
        view.addSubview(memoLabel)
        view.addSubview(memoTextView)
        
        // 뒤로가기 버튼
        backButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(10)
        }
        
        // 저장 버튼
        saveButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-10)
            $0.width.equalTo(backButton.snp.width)
        }
        
        // 멤버 이미지 뷰
        memberImageView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(35)
            $0.leading.equalTo(view.snp.leading).offset(35)
            $0.width.equalToSuperview().dividedBy(2.5)
            $0.height.equalTo(memberImageView.snp.width)
        }
        
        // 이미지 추가 버튼
        addImageButton.snp.makeConstraints {
            $0.top.equalTo(memberImageView.snp.bottom).offset(20)
            $0.centerX.equalTo(memberImageView.snp.centerX)
            $0.width.equalTo(memberImageView.snp.width).dividedBy(2)
        }
        
        // 이름 레이블
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(memberImageView.snp.top)
            $0.leading.equalTo(memberImageView.snp.trailing).offset(20)
        }
        
        // 이름 텍스트 필드
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
            $0.leading.equalTo(memberImageView.snp.trailing).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
        }
        
        // 번호 레이블
        phoneLabel.snp.makeConstraints {
            $0.top.equalTo(nameTextField.snp.bottom).offset(30)
            $0.leading.equalTo(memberImageView.snp.trailing).offset(20)
        }
        
        // 번호 텍스트 필드
        phoneTextField.snp.makeConstraints {
            $0.top.equalTo(phoneLabel.snp.bottom).offset(10)
            $0.leading.equalTo(memberImageView.snp.trailing).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
        }
        
        // 즐겨찾기 레이블
        favoriteLabel.snp.makeConstraints {
            $0.centerY.equalTo(view.safeAreaLayoutGuide.snp.centerY).offset(-100)
            $0.centerX.equalTo(view.safeAreaLayoutGuide.snp.centerX)
        }
        
        // 즐겨찾기 yes 버튼
        yesButton.snp.makeConstraints {
            $0.top.equalTo(favoriteLabel.snp.bottom).offset(25)
            $0.leading.equalTo(view.snp.leading).offset(50)
            $0.trailing.equalTo(noButton.snp.leading).offset(-30)
            $0.width.equalTo(noButton.snp.width)
        }
        
        // 즐겨찾기 no 버튼
        noButton.snp.makeConstraints {
            $0.top.equalTo(favoriteLabel.snp.bottom).offset(25)
            $0.leading.equalTo(yesButton.snp.trailing).offset(30)
            $0.trailing.equalTo(view.snp.trailing).offset(-50)
            $0.width.equalTo(yesButton.snp.width)
        }
        
        // 메모 레이블
        memoLabel.snp.makeConstraints {
            $0.top.equalTo(yesButton.snp.bottom).offset(30  )
            $0.centerX.equalTo(view.snp.centerX)
        }
    
        // 메모 텍스트 필드
        memoTextView.snp.makeConstraints {
            $0.top.equalTo(memoLabel.snp.bottom).offset(20)
            $0.leading.equalTo(view.snp.leading).offset(10)
            $0.trailing.equalTo(view.snp.trailing).offset(-10)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
        }
    }
}

extension UIButton {
    func setBackgroundColor(button: UIButton, isSelected: Bool) {
        if isSelected {
            button.backgroundColor = .systemBlue
        } else {
            button.backgroundColor = .white
        }
    }
}
