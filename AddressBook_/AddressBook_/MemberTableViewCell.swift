//
//  MemberTableViewCell.swift
//  AddressBook_
//
//  Created by 이중엽 on 2023/03/10.
//

import UIKit
import SnapKit

class MemberTableViewCell: UITableViewCell {

    let favoriteButton = UIButton()
    let memberImageView = UIImageView()
    
    let nameLabel = UILabel()
    let phoneNumberLabel = UILabel()
    let memoLabel = UILabel()
    
    let nameDataLabel = UILabel()
    let phoneNumberDataLabel = UILabel()
    let memoDataLabel = UILabel()
    
    func makeUI() {
        let leftStackView = UIStackView(arrangedSubviews: [favoriteButton, memberImageView])
        let centerStackView = UIStackView(arrangedSubviews: [nameLabel, phoneNumberLabel, memoLabel])
        let rightStackView = UIStackView(arrangedSubviews: [nameDataLabel, phoneNumberDataLabel, memoDataLabel])
        let mainStackView = UIStackView(arrangedSubviews: [leftStackView, centerStackView, rightStackView])
        
        self.contentView.addSubview(mainStackView)
        
        // main stack view
        mainStackView.backgroundColor = .gray
        mainStackView.layer.borderWidth = 1
        mainStackView.spacing = 10
        mainStackView.axis = .horizontal
        mainStackView.distribution = .fillEqually
        mainStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        
        // left stack view
        leftStackView.backgroundColor = .red
        leftStackView.layer.borderWidth = 1
        leftStackView.spacing = 10
        leftStackView.axis = .vertical
        leftStackView.distribution = .fill
        leftStackView.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.top).offset(10)
            $0.leading.equalTo(mainStackView.snp.leading).offset(10)
            $0.trailing.equalTo(centerStackView.snp.leading).offset(-10)
            $0.bottom.equalTo(mainStackView.snp.bottom).offset(-10)
        }
        
        favoriteButton.snp.makeConstraints {
            $0.top.equalToSuperview()
        }
        
        // center stack view
        centerStackView.backgroundColor = .orange
        centerStackView.layer.borderWidth = 1
        centerStackView.spacing = 10
        centerStackView.axis = .vertical
        centerStackView.distribution = .fillEqually
        centerStackView.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.top).offset(10)
            $0.leading.equalTo(leftStackView.snp.leading).offset(10)
            $0.trailing.equalTo(rightStackView.snp.leading).offset(-10)
            $0.bottom.equalTo(mainStackView.snp.bottom).offset(-10)
        }
        
        rightStackView.backgroundColor = .yellow
        rightStackView.layer.borderWidth = 1
        rightStackView.spacing = 10
        rightStackView.axis = .vertical
        rightStackView.distribution = .fillEqually
        rightStackView.snp.makeConstraints {
            $0.top.equalTo(mainStackView.snp.top).offset(10)
            $0.leading.equalTo(centerStackView.snp.trailing).offset(10)
            $0.trailing.equalTo(mainStackView.snp.trailing).offset(-10)
            $0.bottom.equalTo(mainStackView.snp.bottom).offset(-10)
        }
    }
}
