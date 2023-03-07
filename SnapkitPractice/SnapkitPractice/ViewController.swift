//
//  ViewController.swift
//  SnapkitPractice
//
//  Created by 이중엽 on 2023/03/06.
//

import UIKit
import SnapKit

enum FirstName: Int {
    case kim = 0
    case park
    case choi
    case lee
}

class ViewController: UIViewController {
    
    let mainTextField = UITextField()
    let addButton = UIButton()
    let testAddButton = UIButton()
    let mainTableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // mainTableView 설정
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        
        // 제약 설정
        makeUI()
        setAction()
    }
    
    func makeUI() {
        view.backgroundColor = .white
        
        let stackView = UIStackView(arrangedSubviews: [mainTextField, addButton])
        stackView.axis = .horizontal
        
        mainTextField.placeholder = "목록에 추가할 아이템을 작성해주세요"
        
        addButton.setTitle("추가", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .link

        view.addSubview(stackView)
        view.addSubview(mainTableView)
        
        stackView.snp.makeConstraints {
            $0.height.equalTo(50)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(10)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-10)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
        }
        
        mainTextField.snp.makeConstraints {
            $0.leading.equalTo(stackView.snp.leading).offset(10)
            $0.centerY.equalTo(stackView.snp.centerY)
            $0.top.equalTo(stackView.snp.top)
            $0.bottom.equalTo(stackView.snp.bottom)
        }
        
        addButton.snp.makeConstraints {
            $0.width.equalTo(50)
            $0.leading.equalTo(mainTextField.snp.trailing)
            $0.trailing.equalTo(stackView.snp.trailing).offset(-10)
            $0.top.equalTo(stackView.snp.top)
            $0.bottom.equalTo(stackView.snp.bottom)
        }
        
        mainTableView.snp.makeConstraints {
            $0.top.equalTo(stackView.snp.bottom).offset(10)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            $0.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
        }
    }
    
    func setAction() {
        addButton.addTarget(self, action: #selector(addButtonClicked), for: .touchUpInside)
    }
    
    @objc func addButtonClicked() {
        let studentName = mainTextField.text!
        
        guard let studentFirstName = studentName.first else { return }
        StudentManager.shared.testAppend(firstName: String(studentFirstName), fullName: studentName)
        
        print(StudentManager.shared.nameList)
        print(StudentManager.shared.sectionList)
        mainTextField.text = ""
        mainTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return StudentManager.shared.sectionList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return StudentManager.shared.sectionList[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StudentManager.shared.nameList[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.mainTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let firstNameList = StudentManager.shared.nameList[indexPath.section]
        cell.mainLabel.text = firstNameList[indexPath.row]
        
        cell.makeUI()
        return cell
    }
}
