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
    
    var nameList: [[String]] = []
    var sectionList: [String] = []
    
    func append(firstName: String, fullName: String) {
        var isFirstNameExist = false
        
        // 이름 리스트와 섹션 리스트에 아직 아무것도 없을 때
        if nameList.isEmpty && sectionList.isEmpty {
            nameList.append([fullName])
            sectionList.append(firstName)
            return
        }
        
        // 성 씨가 섹션 리스트에 존재하는지 체크
        for index in 0 ..< sectionList.count {
            if sectionList[index] == firstName {
                isFirstNameExist = true
                break
            }
        }
        
        for index in 0 ..< nameList.count {
            // 해당 성씨가 존재한다면 이름 리스트에만 추가
            if sectionList[index] == firstName {
                nameList[index].append(fullName)
                break
            }
            
            // 해당 성씨가 존재하지 않으면 이름 리스트, 섹션 리스트 추가
            if !isFirstNameExist {
                nameList.append([fullName])
                sectionList.append(firstName)
                break
            }
        }
    }
}
