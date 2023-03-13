//
//  ViewController.swift
//  DdayCalendar
//
//  Created by 이중엽 on 2023/03/13.
//

import UIKit

/*
 TODO: datePicker를 inline 스타일로 구현
 TODO: datePicker에 시간 설정은 없애기 (date만 있게)
 TODO: D-Day 구현
 TODO: User가 DetailVC에서 image를 추가할 수 있도록 구현 (이미지뷰, 버튼)
 TODO: 버튼을 누르면 사진첩이 뜨고 거기서 이미지 선택 (ImagePicker)
 ---------------------------------필수
 TODO: 오른쪽 barbutton을 누르면 달력이 보이도록 하기
 - 이 달력에 d-day로 등록된 이벤트가 있는 날짜에 점이 보이도록 하기
 */

class ViewController: UIViewController {
    @IBOutlet weak var ddayTableView: UITableView!
    
    let dateFormator: DateFormatter = {
       let df = DateFormatter()
        df.locale = Locale(identifier: "ko_KR")
        df.dateFormat = "yy년 MM월 dd일"
        return df
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ddayTableView.delegate = self
        ddayTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ddayTableView.reloadData()
    }

    @IBAction func addButtonClicked(_ sender: Any) {
        guard let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as? DetailViewController else { return }
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    @IBAction func editButtonClicked(_ sender: Any) {
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataStorage.ddayList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mainCell", for: indexPath) as? MainTableViewCell else { return UITableViewCell() }
        
        let item = DataStorage.ddayList[indexPath.row]
        cell.cellImageView.image = item.thumbnail ?? UIImage(systemName: "pencil")
        cell.nameLabel.text = item.title
        cell.dateLabel.text = dateFormator.string(from: item.date)
        cell.dDayLabel.text = "-"
        cell.memoLabel.text = item.memo ?? "메모 없음"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
