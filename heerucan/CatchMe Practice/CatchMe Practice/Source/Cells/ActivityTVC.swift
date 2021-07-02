//
//  ActivityTVC.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/06/29.
//

import UIKit

import Then
import SnapKit

class ActivityTVC: UITableViewCell {
    
    static let identifier = "ActivityTVC"
    
    // MARK: - Property
    
    let pinImage = UIImageView().then {
        $0.image = UIImage(named: "icPin")
    }
    
    let lineView = UIView().then {
        $0.backgroundColor = UIColor(white: 1.0, alpha: 0.1)
    }
    
    let dateLabel = UILabel().then {
        $0.text = "2021.08.01"
        $0.textColor = .textGray
        $0.font = .systemFont(ofSize: 14, weight: .regular)
    }
    
    let moreButton = UIButton().then {
        $0.setImage(UIImage(named: "btnMore"), for: .normal)
    }
    
    let commentView = UIImageView().then {
        $0.image = UIImage(named: "icComment")
    }
    
    let commentLabel = UILabel().then {
        $0.text = "암벽을 올랐다. 뿌듯해따 -.-암벽을 올랐다. 뿌듯해따 -.-암벽을 올랐다. 뿌듯해따 -.-암벽을 올랐다. 뿌듯해따 -.-암벽을 올랐다. 뿌듯해따 -.-"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 14, weight: .regular)
        $0.numberOfLines = 0
    }
    
    let photoImageView = UIImageView().then {
        $0.backgroundColor = .lightGray
        $0.layer.cornerRadius = 18
    }
    
        
    // MARK: - setupConfigure
    
    func setupConfigure() {
        
        addSubviews([pinImage, lineView, dateLabel, moreButton, commentView])
        
        commentView.addSubview(commentLabel)
        
        pinImage.snp.makeConstraints { (make) in
            make.top.equalTo(23)
            make.leading.equalTo(22)
        }
        
        lineView.snp.makeConstraints { (make) in
            make.top.equalTo(pinImage.snp.bottom)
            make.leading.equalTo(27.5)
            make.bottom.equalToSuperview().offset(25)
            make.width.equalTo(1)
        }
        
        dateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.leading.equalTo(pinImage.snp.trailing).offset(9)
        }
        
        moreButton.snp.makeConstraints { (make) in
            make.top.equalTo(5)
            make.trailing.equalTo(-6)
        }
        
        commentView.snp.makeConstraints { (make) in
            make.top.equalTo(dateLabel.snp.bottom).offset(12)
            make.leading.equalTo(lineView.snp.trailing).offset(15.5)
            make.bottom.equalTo(-27)
            make.trailing.equalToSuperview().offset(-28)
        }
        
        commentLabel.snp.makeConstraints { (make) in
            make.top.equalTo(12)
            make.leading.equalTo(18)
            make.trailing.equalTo(-20)
            make.bottom.equalTo(-16)
        }
        
//        photoImageView.snp.makeConstraints { (make) in
//            make.top.equalTo(commentView.snp.bottom).offset(16)
//            make.leading.equalTo(lineView.snp.trailing).offset(15.5)
//            make.bottom.equalTo(-27)
//            make.trailing.equalTo(-28)
//            make.width.equalTo(303)
//            make.height.equalTo(228)
//        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
