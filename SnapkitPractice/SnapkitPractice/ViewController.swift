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
        StudentManager.shared.append(firstName: studentFirstName, fullName: studentName)
        
        mainTextField.text = ""
        mainTableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return StudentManager.shared.sectiontList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let firstName = FirstName(rawValue: section)
        
        switch firstName {
        case .kim:  return "김씨 리스트"
        case .park: return "박씨 리스트"
        case .choi: return "최씨 리스트"
        case .lee:  return "이씨 리스트"
        case .none: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let firstName = FirstName(rawValue: section)
        
        switch firstName {
        case .kim:  return StudentManager.shared.kimList.count
        case .park: return StudentManager.shared.parkList.count
        case .choi: return StudentManager.shared.choiList.count
        case .lee:  return StudentManager.shared.leeList.count
        case .none: return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.mainTableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? CustomTableViewCell else { return UITableViewCell() }
        
        let firstName = FirstName(rawValue: indexPath.section)
        switch firstName {
        case .kim:  cell.mainLabel.text = StudentManager.shared.kimList[indexPath.row]
        case .park: cell.mainLabel.text = StudentManager.shared.parkList[indexPath.row]
        case .choi: cell.mainLabel.text = StudentManager.shared.choiList[indexPath.row]
        case .lee:  cell.mainLabel.text = StudentManager.shared.leeList[indexPath.row]
        case .none: break
        }
        
        cell.makeUI()
        return cell
    }
}
