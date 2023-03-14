//
//  Dday.swift
//  DdayCalendar
//
//  Created by 이중엽 on 2023/03/13.
//

import UIKit

struct Dday {
    var curDate: Date
    var selectedDate: Date
    var title: String
    var memo: String?
    var thumbnail: UIImage?
    
    private let dateFormator: DateFormatter = {
       let df = DateFormatter()
        df.locale = Locale(identifier: "ko_KR")
        df.dateFormat = "yy년 MM월 dd일"
        return df
    }()
    
    mutating func getDday() -> String {
        let dayToSeconds    = 24 * 60 * 60
        // 데이트 포맷에 맞춰서 String으로 임시 변경 ( 시 분 초 단위는 날림 )
        let current         = dateFormator.string(from: curDate)
        let select          = dateFormator.string(from: selectedDate)
        // 다시 Date 형태로 변경
        curDate             = dateFormator.date(from: current) ?? Date()
        selectedDate        = dateFormator.date(from: select) ?? Date()
        let interval        = Int(selectedDate.timeIntervalSince(curDate))
        let dday            = interval / dayToSeconds
        
        if dday == 0 {
            return "D-Day"
        } else if dday > 0 {
            return "D-\(dday)"
        } else {
            return "D+\(dday.magnitude)"
        }
    }
}
