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
    }
    
    private var memberList: [Member] = []
    private var favoriteMemberList: [Member] = []
    
    func count() -> Int {
        return 1
    }
}
