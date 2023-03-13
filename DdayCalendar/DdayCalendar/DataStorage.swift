//
//  DataStorage.swift
//  DdayCalendar
//
//  Created by 이중엽 on 2023/03/13.
//

import UIKit

struct DataStorage {
    static var ddayList: [Dday] = [
    
        Dday(date: Date(), title: "오늘", thumbnail: UIImage(systemName: "car")),
        Dday(date: Date(timeIntervalSinceNow: 1000), title: "오늘"),
        Dday(date: Date(), title: "오늘1", thumbnail: UIImage(systemName: "star")),
        Dday(date: Date(), title: "오늘2"),
        Dday(date: Date(), title: "오늘3"),
    ]
    
    
}
