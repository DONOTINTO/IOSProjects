//
//  CustomTableViewCell.swift
//  SnapkitPractice
//
//  Created by 이중엽 on 2023/03/06.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    let mainLabel = UILabel()
    
    func makeUI() {
        contentView.addSubview(mainLabel)
        mainLabel.font = .systemFont(ofSize: 20, weight: .bold)
        mainLabel.text = "test"
        mainLabel.snp.makeConstraints {
            $0.leading.equalTo(self.contentView.snp.leading).offset(10)
            $0.trailing.equalTo(self.contentView.snp.trailing).offset(-10)
            $0.top.equalTo(self.contentView.snp.top).offset(10)
            $0.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
        }
    }
}
