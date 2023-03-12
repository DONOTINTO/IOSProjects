//
//  ViewController.swift
//  AddressBook_
//
//  Created by 이중엽 on 2023/03/10.
//

import UIKit
import SnapKit

class ViewController: UIViewController, NotifyViewDiss {
    func reloadTable() {
        mainTableView.reloadData()
    }
    
    let mainTextField = UITextField()
    let findMemberButton = UIButton()
    
    let allCategoryButton = UIButton()
    let favoriteCategoryButton = UIButton()
    let addMemberButton = UIButton()
    
    let mainTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(MemberTableViewCell.self , forCellReuseIdentifier: "MemberCell")
        
        //초기 설정
        allCategoryButton.isSelected = true
        allCategoryButton.backgroundColor = .systemBlue
        favoriteCategoryButton.isSelected = false
        favoriteCategoryButton.backgroundColor = .white
        
        makeUI()
        addAction()
    }

    func makeUI() {
        self.view.backgroundColor = .white
        
        // MARK: - 스택뷰 생성 및 뷰 추가
        let textFieldStackView = UIStackView(arrangedSubviews: [mainTextField, findMemberButton])
        let buttonStackView = UIStackView(arrangedSubviews: [allCategoryButton, favoriteCategoryButton])
        
        self.view.addSubview(textFieldStackView)
        self.view.addSubview(buttonStackView)
        self.view.addSubview(mainTableView)
        self.view.addSubview(addMemberButton)
        
        // MARK: - 색상 / 폰트 크기 / 기본 값 설정
        mainTableView.backgroundColor = .white
        mainTableView.layer.borderWidth = 1
        mainTableView.layer.cornerRadius = 5
        mainTableView.clipsToBounds = true
        
        // 텍스트 필드 설정
        mainTextField.font = .systemFont(ofSize: 15)
        mainTextField.placeholder = "이름 또는 연락처를 입력해주세요."
        mainTextField.setPlaceholder(color: .lightGray)
        mainTextField.layer.cornerRadius = 5
        mainTextField.layer.borderWidth = 2
        mainTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 8, height: 0))
        mainTextField.leftViewMode = .always
        
        // 찾기 버튼 설정
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName:"magnifyingglass", withConfiguration: imageConfig)
        findMemberButton.setImage(image, for: .normal)
        findMemberButton.layer.cornerRadius = 5
        findMemberButton.layer.borderWidth = 2
        
        // 찾기 버튼 이미지 설정
        findMemberButton.imageView!.snp.makeConstraints {
            $0.leading.equalTo(5)
            $0.trailing.equalTo(-5)
            $0.top.equalTo(2)
            $0.bottom.equalTo(-2)
        }
        
        // All 선택 버튼 설정
        allCategoryButton.setTitle("ALL", for: .normal)
        allCategoryButton.setTitleColor(.black, for: .normal)
        allCategoryButton.setTitleColor(.systemBlue, for: .highlighted)
        allCategoryButton.titleLabel?.font = .systemFont(ofSize: 15)
        allCategoryButton.layer.cornerRadius = 5
        allCategoryButton.layer.borderWidth = 2
        if allCategoryButton.isSelected {
            allCategoryButton.backgroundColor = .systemBlue
        } else {
            allCategoryButton.backgroundColor = .white
        }
        
        // Favorite 선택 버튼 설정
        favoriteCategoryButton.setTitle("Favorite", for: .normal)
        favoriteCategoryButton.setTitleColor(.black, for: .normal)
        favoriteCategoryButton.setTitleColor(.systemBlue, for: .highlighted)
        favoriteCategoryButton.titleLabel?.font = .systemFont(ofSize: 15)
        favoriteCategoryButton.layer.cornerRadius = 5
        favoriteCategoryButton.layer.borderWidth = 2
        
        // 멤버 추가 버튼 설정
        addMemberButton.setImage(UIImage(systemName: "plus"), for: .normal)
        addMemberButton.layer.cornerRadius = 5
        addMemberButton.layer.borderWidth = 2
        
        // MARK: - 제약 조건 설정
        // 텍스트 필드 스택 뷰
        textFieldStackView.spacing = 5
        textFieldStackView.axis = .horizontal
        textFieldStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-20)
            $0.bottom.equalTo(buttonStackView.snp.top).offset(-20)
            $0.height.equalTo(mainTextField.snp.height)
        }
        
        mainTextField.snp.makeConstraints {
            $0.leading.top.bottom.equalToSuperview()
            $0.trailing.equalTo(findMemberButton.snp.leading).offset(-5)
        }

        findMemberButton.snp.makeConstraints {
            $0.trailing.top.bottom.equalToSuperview()
            $0.leading.equalTo(mainTextField.snp.trailing).offset(5)
        }
        
        // 버튼 스택 뷰
        buttonStackView.spacing = 10
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually
        buttonStackView.snp.makeConstraints {
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(20)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(addMemberButton.snp.leading).offset(-45)
            $0.bottom.equalTo(mainTableView.snp.top).offset(-15)
        }
        
        addMemberButton.snp.makeConstraints {
            $0.width.equalTo(60)
            $0.top.equalTo(textFieldStackView.snp.bottom).offset(20)
            $0.leading.equalTo(buttonStackView.snp.trailing).offset(45)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.bottom.equalTo(mainTableView.snp.top).offset(-15)
        }
        
        // 테이블 뷰
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(buttonStackView.snp.bottom).offset(15)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
        }
    }
    
    func addAction() {
        allCategoryButton.addTarget(self, action: #selector(allCategoryButtonClicked), for: .touchUpInside)
        favoriteCategoryButton.addTarget(self, action: #selector(favoriteCategoryButtonClicked), for: .touchUpInside)
        addMemberButton.addTarget(self, action: #selector(addMemberButtonClicked), for: .touchUpInside)
    }
    
    @objc func allCategoryButtonClicked() {
        allCategoryButton.isSelected.toggle()
        favoriteCategoryButton.isSelected = !allCategoryButton.isSelected
        if allCategoryButton.isSelected {
            allCategoryButton.backgroundColor = .systemBlue
            favoriteCategoryButton.backgroundColor = .white
        } else {
            favoriteCategoryButton.backgroundColor = .systemBlue
            allCategoryButton.backgroundColor = .white
        }
    }
    
    @objc func favoriteCategoryButtonClicked() {
        favoriteCategoryButton.isSelected.toggle()
        allCategoryButton.isSelected = !favoriteCategoryButton.isSelected
        if allCategoryButton.isSelected {
            allCategoryButton.backgroundColor = .systemBlue
            favoriteCategoryButton.backgroundColor = .white
        } else {
            favoriteCategoryButton.backgroundColor = .systemBlue
            allCategoryButton.backgroundColor = .white
        }
    }
    
    @objc func addMemberButtonClicked() {
        let detailVC = DetailViewController()
        detailVC.delegate = self
        detailVC.modalPresentationStyle = .fullScreen
        present(detailVC, animated: true)
    }
}

extension UIViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MemberManger.shared.count()
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MemberCell", for: indexPath) as? MemberTableViewCell else { return UITableViewCell() }
        
        cell.initialSetup(index: indexPath.row)
        cell.makeUI()
        
        return cell
    }
}
