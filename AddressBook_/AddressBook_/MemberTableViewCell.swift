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
        addSubview(favoriteButton)
        addSubview(memberImageView)
        
        addSubview(nameLabel)
        addSubview(phoneNumberLabel)
        addSubview(memoLabel)
        
        addSubview(nameDataLabel)
        addSubview(phoneNumberDataLabel)
        addSubview(memoDataLabel)
        
        // 왼쪽 상단 즐겨찾기 버튼
        favoriteButton.frame.size = CGSize(width: 30, height: 30)
        favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        favoriteButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(10)
        }
        
        // 왼쪽 중간 멤버 이미지 뷰
        memberImageView.image = UIImage(systemName: "pencil")
        memberImageView.snp.makeConstraints {
            $0.top.equalTo(favoriteButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.width.equalToSuperview().dividedBy(4)
            $0.height.equalTo(memberImageView.snp.width)
        }
        
        // 가운데 info name
        nameLabel.text = "name"
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(memberImageView.snp.trailing).offset(23.5)
            $0.width.equalTo(nameDataLabel.snp.width).dividedBy(3)
            $0.height.equalTo(phoneNumberLabel.snp.height)
            $0.centerY.equalTo(nameDataLabel.snp.centerY)
        }
        
        // 가운데 info phone number
        phoneNumberLabel.text = "phone"
        phoneNumberLabel.textAlignment = .left
        phoneNumberLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        phoneNumberLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(12)
            $0.leading.equalTo(memberImageView.snp.trailing).offset(23.5)
            $0.width.equalTo(phoneNumberDataLabel.snp.width).dividedBy(3)
            $0.centerY.equalTo(phoneNumberDataLabel.snp.centerY)
        }
        
        // 가운데 info memo
        memoLabel.text = "memo"
        memoLabel.textAlignment = .left
        memoLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        memoLabel.snp.makeConstraints {
            $0.top.equalTo(phoneNumberLabel.snp.bottom).offset(12)
            $0.leading.equalTo(memberImageView.snp.trailing).offset(23.5)
            $0.bottom.equalToSuperview().offset(-20)
            $0.width.equalTo(memoDataLabel.snp.width).dividedBy(3)
            $0.height.equalTo(phoneNumberLabel.snp.height)
            $0.centerY.equalTo(memoDataLabel.snp.centerY)
        }
        
        // 오른쪽 name data
        nameDataLabel.text = "name"
        nameDataLabel.textAlignment = .left
        nameDataLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        nameDataLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-14)
        }
        
        // 가운데 phone data
        phoneNumberDataLabel.text = "phone"
        phoneNumberDataLabel.textAlignment = .left
        phoneNumberDataLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        phoneNumberDataLabel.snp.makeConstraints {
            $0.top.equalTo(nameDataLabel.snp.bottom).offset(12)
            $0.leading.equalTo(phoneNumberLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-14)
        }
        
        // 가운데 phone data
        memoDataLabel.text = "memo"
        memoDataLabel.textAlignment = .left
        memoDataLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        memoDataLabel.layer.borderWidth = 1
        memoDataLabel.snp.makeConstraints {
            $0.leading.equalTo(memoLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-14)
            $0.bottom.equalToSuperview().offset(-8)
        }
    }
}
