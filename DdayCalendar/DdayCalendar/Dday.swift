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
    
    let dateFormator: DateFormatter = {
       let df = DateFormatter()
        df.locale = Locale(identifier: "ko_KR")
        df.dateFormat = "yy년 MM월 dd일"
        return df
    }()
    
    func getDday() -> String {
        let dayToSeconds    = 24 * 60 * 60
        let interval        = Int(selectedDate.timeIntervalSince(curDate))
        var dday            = interval / dayToSeconds
        let leftTime        = interval % dayToSeconds
        
        if dday == 0 {
            return "D-\(dday)"
        } else if dday > 0 {
            return "D-\(dday + 1)"
        } else {
            return "D+\(dday.magnitude)"
        }
    }
}
