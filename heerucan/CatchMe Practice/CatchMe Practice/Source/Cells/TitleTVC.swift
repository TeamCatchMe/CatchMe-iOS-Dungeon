//
//  TitleTableCell.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/06/29.
//

import UIKit

import Then
import SnapKit

class TitleTVC: UITableViewCell {
    
    static let identifier = "TitleTVC"
    
    // MARK: - Property
    
    let dateLabel = UILabel().then {
        $0.text = "2021.05.01부터"
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.textColor = .textGray
        
        let attributedString = NSMutableAttributedString(string: $0.text!)
        attributedString.addAttribute(.font, value: UIFont.systemFont(ofSize: 12), range: ($0.text! as NSString).range(of: "부터"))
        $0.attributedText = attributedString
    }
        
    let likeLabel = UILabel().then {
        $0.text = "23"
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.textColor = .white
    }
    
    let likeButton = UIButton().then {
        $0.setImage(UIImage(named: "iconLike"), for: .normal)
    }
    
    let nameLabel = UILabel().then {
        $0.text = "눈만 뜨면\n암벽등반 생각 뿐인 날다람쥐"
        $0.numberOfLines = 2
        $0.font = .systemFont(ofSize: 21, weight: .bold)
        $0.textColor = .white
    }
        
    let firstLine = LineView()
    
    let actStackView = ReportStackView()
    let actNumLabel = ReportNumLabel(numText: "24")
    let actLabel = ReportLabel(reportText: "활동 수")
    
    let ratioStackView = ReportStackView()
    let ratioNumLabel = ReportNumLabel(numText: "50%")
    let ratioLabel = ReportLabel(reportText: "전체 중 비율")
   
    let weekStackView = ReportStackView()
    let weekNumLabel = ReportNumLabel(numText: "3")
    let weekLabel = ReportLabel(reportText: "이번 주 활동 수")
    
    let secondLine = LineView()
    
    // MARK: - setUPConfigure
    
    func setupConfigure() {
        
        backgroundColor = .mainBackground
        
        addSubviews([dateLabel, likeLabel, likeButton, nameLabel, firstLine,
                     actStackView, ratioStackView, weekStackView, secondLine])
        
        actStackView.addArrangedSubview(actNumLabel)
        actStackView.addArrangedSubview(actLabel)
        
        ratioStackView.addArrangedSubview(ratioNumLabel)
        ratioStackView.addArrangedSubview(ratioLabel)
        
        weekStackView.addArrangedSubview(weekNumLabel)
        weekStackView.addArrangedSubview(weekLabel)
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(26)
            make.leading.equalTo(28)
        }
        
        likeButton.snp.makeConstraints { (make) in
            make.top.equalTo(18)
            make.trailing.equalTo(-18)
        }
        
        likeLabel.snp.makeConstraints { (make) in
            make.top.equalTo(26)
            make.trailing.equalTo(likeButton.snp.leading).offset(6)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(12)
            make.leading.equalTo(28)
        }
        
        firstLine.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
        }
        
        actStackView.snp.makeConstraints { (make) in
            make.top.equalTo(firstLine.snp.bottom).offset(10)
            make.leading.equalTo(48)
        }
        
        ratioStackView.snp.makeConstraints { (make) in
            make.top.equalTo(firstLine.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
        }
        
        weekStackView.snp.makeConstraints { (make) in
            make.top.equalTo(firstLine.snp.bottom).offset(10)
            make.trailing.equalTo(-28)
        }
        
        secondLine.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()

        }        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}
