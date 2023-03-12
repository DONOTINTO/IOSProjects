//
//  MemberTableViewCell.swift
//  AddressBook_
//
//  Created by 이중엽 on 2023/03/10.
//

import UIKit
import SnapKit

class MemberTableViewCell: UITableViewCell {

    let favoriteButton          = UIButton()
    let memberImageView         = UIImageView()
    
    let nameLabel               = UILabel()
    let phoneNumberLabel        = UILabel()
    let memoLabel               = UILabel()
    
    let nameDataLabel           = UILabel()
    let phoneNumberDataLabel    = UILabel()
    let memoCheckButton         = UIButton()
    
    // ********************************
    // MARK: - initialSetup
    // ********************************
    func initialSetup(index: Int) {
        // 기본 배경 색상
        contentView.backgroundColor = .white
        
        // 즐겨찾기 버튼
        let isFavorite = MemberManger.shared.memberIsFovorite(index: index)
        favoriteButton.frame.size = CGSize(width: 30, height: 30)
        if isFavorite {
            favoriteButton.setImage(UIImage(systemName: "star.fill"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(systemName: "star"), for: .normal)
        }
        
        // 멤버 이미지 뷰
        // let memberImage = MemberManger.shared.memberImage(index: index)
        // memberImageView.image = memberImage
        memberImageView.image = UIImage(systemName: "pencil")
        
        // 이름 레이블
        nameLabel.backgroundColor = .white
        nameLabel.textColor = .black
        nameLabel.text = "name"
        nameLabel.textAlignment = .left
        nameLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        
        // 번호 레이블
        phoneNumberLabel.backgroundColor = .white
        phoneNumberLabel.textColor = .black
        phoneNumberLabel.text = "phone"
        phoneNumberLabel.textAlignment = .left
        phoneNumberLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        
        // 메모 레이블
        memoLabel.backgroundColor = .white
        memoLabel.textColor = .black
        memoLabel.text = "memo"
        memoLabel.textAlignment = .left
        memoLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        
        // 이름 정보 레이블
        nameDataLabel.backgroundColor = .white
        nameDataLabel.textColor = .black
        nameDataLabel.text = MemberManger.shared.memberName(index: index)
        nameDataLabel.textAlignment = .left
        nameDataLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        
        // 번호 정보 레이블
        phoneNumberDataLabel.backgroundColor = .white
        phoneNumberDataLabel.textColor = .black
        phoneNumberDataLabel.text = MemberManger.shared.memberPhoneNumber(index: index)
        phoneNumberDataLabel.textAlignment = .left
        phoneNumberDataLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        
        // 메모 정보 레이블
        memoCheckButton.backgroundColor = .white
        memoCheckButton.setTitleColor(.black, for: .normal)
        memoCheckButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        memoCheckButton.setTitle("메모 확인하기", for: .normal)
        memoCheckButton.layer.borderWidth = 1
        memoCheckButton.layer.cornerRadius = 5
        memoCheckButton.clipsToBounds = true
    }
    
    // ********************************
    // MARK: - makeUI
    // ********************************
    func makeUI() {
        contentView.addSubview(favoriteButton)
        contentView.addSubview(memberImageView)
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneNumberLabel)
        contentView.addSubview(memoLabel)
        
        contentView.addSubview(nameDataLabel)
        contentView.addSubview(phoneNumberDataLabel)
        contentView.addSubview(memoCheckButton)
        
        // 즐겨찾기 버튼
        favoriteButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview().offset(10)
        }
        
        // 멤버 이미지 뷰
        memberImageView.snp.makeConstraints {
            $0.top.equalTo(favoriteButton.snp.bottom).offset(10)
            $0.leading.equalToSuperview().offset(10)
            $0.bottom.equalToSuperview().offset(-10)
            $0.width.equalToSuperview().dividedBy(4)
            $0.height.equalTo(memberImageView.snp.width)
        }
        
        // 이름 레이블
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(memberImageView.snp.trailing).offset(23.5)
            $0.width.equalTo(nameDataLabel.snp.width).dividedBy(3)
            $0.height.equalTo(phoneNumberLabel.snp.height)
            $0.centerY.equalTo(nameDataLabel.snp.centerY)
        }
        
        // 번호 레이블
        phoneNumberLabel.snp.makeConstraints {
            $0.top.equalTo(nameLabel.snp.bottom).offset(12)
            $0.leading.equalTo(memberImageView.snp.trailing).offset(23.5)
            $0.width.equalTo(phoneNumberDataLabel.snp.width).dividedBy(3)
            $0.centerY.equalTo(phoneNumberDataLabel.snp.centerY)
        }
        
        // 메모 레이블
        memoLabel.snp.makeConstraints {
            $0.top.equalTo(phoneNumberLabel.snp.bottom).offset(12)
            $0.leading.equalTo(memberImageView.snp.trailing).offset(23.5)
            $0.bottom.equalToSuperview().offset(-20)
            $0.width.equalTo(memoCheckButton.snp.width).dividedBy(3)
            $0.height.equalTo(phoneNumberLabel.snp.height)
            $0.centerY.equalTo(memoCheckButton.snp.centerY)
        }
        
        // 이름 정보 레이블
        nameDataLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalTo(nameLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-14)
        }
        
        // 번호 정보 레이블
        phoneNumberDataLabel.snp.makeConstraints {
            $0.top.equalTo(nameDataLabel.snp.bottom).offset(12)
            $0.leading.equalTo(phoneNumberLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-14)
        }
        
        // 메모 정보 레이블
        memoCheckButton.snp.makeConstraints {
            $0.leading.equalTo(memoLabel.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().offset(-14)
        }
    }
}
