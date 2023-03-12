//
//  memberManager.swift
//  AddressBook_
//
//  Created by 이중엽 on 2023/03/10.
//

import UIKit

class MemberManger {
    
    static let shared = MemberManger()
    
    private var memberList: [Member] = []
    
    struct Member {
        var image: UIImage
        var name: String
        var phoneNumber: String
        var memo: String
        var isFavorite: Bool
    }
    
    func append(image: UIImage, name: String, phoneNumber: String, memo: String, isFavorite: Bool) {
        let newMember = Member(image: image, name: name, phoneNumber: phoneNumber, memo: memo, isFavorite: isFavorite)
        
        memberList.append(newMember)
    }
    
    func count() -> Int {
        return memberList.count
    }
    
    func memberImage(index: Int) -> UIImage {
        return memberList[index].image
    }
    
    func memberName(index: Int) -> String {
        return memberList[index].name
    }
    
    func memberPhoneNumber(index: Int) -> String {
        return memberList[index].phoneNumber
    }
    
    func memberMemo(index: Int) -> String {
        return memberList[index].memo
    }
    
    func memberIsFovorite(index: Int) -> Bool {
        return memberList[index].isFavorite
    }
}
