//
//  StudentManager.swift
//  SnapkitPractice
//
//  Created by 이중엽 on 2023/03/06.
//

import Foundation

class StudentManager {
    
    static let shared = StudentManager()
    
    private init() {}
    
    var sectiontList: [String] = ["김", "박", "최", "이"]
    var kimList: [String] = []
    var parkList: [String] = []
    var choiList: [String] = []
    var leeList: [String] = []
    
    func append(firstName: Character, fullName: String) {
        switch firstName {
        case "김": StudentManager.shared.kimList.append(fullName); break
        case "박": StudentManager.shared.parkList.append(fullName); break
        case "최": StudentManager.shared.choiList.append(fullName); break
        case "이": StudentManager.shared.leeList.append(fullName); break
        default: break
        }
    }
}
