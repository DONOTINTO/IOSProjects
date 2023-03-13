//
//  ViewController.swift
//  SnapkitPractice2
//
//  Created by 이중엽 on 2023/03/09.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let leftTopView = UIView()
    let leftTopView2 = UIView()
    let leftTopView3 = UIView()
    let leftTopView4 = UIView()
    
    let rightTopButton = UIButton()
    let rightTopButton2 = UIButton()
    let rightTopButton3 = UIButton()
    
    let centerView = UIView()
    let centerView2 = UIView()
    
    let bottomLabel = UILabel()
    let bottomLabel2 = UILabel()
    let bottomLabel3 = UILabel()
    let bottomLabel4 = UILabel()
    let bottomLabel5 = UILabel()
    
    let leftTopStackView = UIStackView()
    let rightTopStackView = UIStackView()
    let bottomStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        makeUI()
    }

    func makeUI() {
        
        leftTopStackView.addArrangedSubview(leftTopView)
        leftTopStackView.addArrangedSubview(leftTopView2)
        leftTopStackView.addArrangedSubview(leftTopView3)
        leftTopStackView.addArrangedSubview(leftTopView4)
        
        rightTopStackView.addArrangedSubview(rightTopButton)
        rightTopStackView.addArrangedSubview(rightTopButton2)
        rightTopStackView.addArrangedSubview(rightTopButton3)
        
        bottomStackView.addArrangedSubview(bottomLabel)
        bottomStackView.addArrangedSubview(bottomLabel2)
        bottomStackView.addArrangedSubview(bottomLabel3)
        bottomStackView.addArrangedSubview(bottomLabel4)
        bottomStackView.addArrangedSubview(bottomLabel5)
        
        self.view.addSubview(leftTopStackView)
        self.view.addSubview(rightTopStackView)
        self.view.addSubview(centerView)
        self.view.addSubview(centerView2)
        self.view.addSubview(bottomStackView)
        
        //왼쪽 상단 스택 뷰
        leftTopStackView.axis = .vertical
        leftTopStackView.spacing = 20
        leftTopStackView.backgroundColor = .gray
        leftTopStackView.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(30)
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            $0.trailing.equalTo(rightTopStackView.snp.leading).offset(-30)
            $0.bottom.equalTo(centerView.snp.top).offset(-30)
        }
        
        leftTopView.backgroundColor = .red
        leftTopView.snp.makeConstraints {
            $0.height.equalTo(leftTopView.snp.width)
        }
        
        leftTopView2.backgroundColor = .orange
        leftTopView2.snp.makeConstraints {
            $0.height.equalTo(leftTopView2.snp.width).dividedBy(2)
        }
        
        leftTopView3.backgroundColor = .yellow
        leftTopView3.snp.makeConstraints {
            $0.height.equalTo(leftTopView3.snp.width).dividedBy(3)
        }
        leftTopView4.backgroundColor = .green
        leftTopView4.snp.makeConstraints {
            $0.height.equalTo(leftTopView4.snp.width).dividedBy(4)
        }
        
        //오른쪽 상단 스택 뷰
        rightTopStackView.axis = .horizontal
        rightTopStackView.spacing = 20
        rightTopStackView.backgroundColor = .gray
        rightTopStackView.distribution = .fillEqually
        
        rightTopStackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(30)
            $0.leading.equalTo(leftTopStackView.snp.trailing).offset(30)
            $0.trailing.equalTo(view.snp.trailing).offset(-30)
        }
        
        rightTopButton.backgroundColor = .purple
        rightTopButton.setTitle("버튼1", for: .normal)
        rightTopButton2.backgroundColor = .purple
        rightTopButton2.setTitle("버튼2", for: .normal)
        rightTopButton3.backgroundColor = .purple
        rightTopButton3.setTitle("버튼3", for: .normal)
        
        //센터 뷰
        centerView.backgroundColor = .systemBlue
        
        let centerViewRatio: Double = 8 / 15
        centerView.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(30)
            $0.trailing.equalTo(view.snp.trailing).offset(-30)
            $0.height.equalTo(centerView.snp.width).multipliedBy(centerViewRatio)
        }
        
        //센터 뷰 가운데
        centerView2.backgroundColor = .white
        centerView2.snp.makeConstraints {
            $0.leading.equalTo(centerView.snp.leading).offset(30)
            $0.trailing.equalTo(centerView.snp.trailing).offset(-30)
            $0.height.equalTo(30)
            $0.centerX.equalTo(centerView.snp.centerX)
            $0.centerY.equalTo(centerView.snp.centerY)
        }
        
        //하단 스택 뷰
        bottomStackView.backgroundColor = .systemPink
        bottomStackView.axis = .vertical
        bottomStackView.spacing = 30
        bottomStackView.alignment = .leading
        
        bottomStackView.snp.makeConstraints {
            $0.top.equalTo(centerView.snp.bottom).offset(30)
            $0.leading.equalTo(view.snp.leading).offset(30)
            $0.trailing.equalTo(view.snp.trailing).offset(-30)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
        }
        
        bottomLabel.backgroundColor = .lightGray
        bottomLabel.text = "안"
        bottomLabel2.backgroundColor = .lightGray
        bottomLabel2.text = "안녕"
        bottomLabel3.backgroundColor = .lightGray
        bottomLabel3.text = "안녕하"
        bottomLabel4.backgroundColor = .lightGray
        bottomLabel4.text = "안녕하세"
        bottomLabel5.backgroundColor = .lightGray
        bottomLabel5.text = "안녕하세요"
    }
}

