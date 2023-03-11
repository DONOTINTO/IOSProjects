//
//  memberManager.swift
//  AddressBook_
//
//  Created by 이중엽 on 2023/03/10.
//

import Foundation

class MemberManger {
    
    static let shared = MemberManger()
    
    struct Member {
        var name: String
        var phoneNumber: Int
        var memo: String
        var isFavorite: Bool
    }
    
    private var memberList: [Member] = []
    
    func count() -> Int {
        return memberList.count
    }
}
