//
//  ContentCVC.swift
//  LookViewPractice
//
//  Created by 양수빈 on 2021/09/06.
//

import UIKit
import SnapKit

class ContentCVC: UICollectionViewCell {
    static let identifier = "ContentCVC"
    
    let charBackground = UIView()
    let charImage = UIImageView()
    let nameLabel = UILabel()
    let timeLabel = UILabel()
    let charNameLabel = UILabel()
    let contentLabel = UILabel()
    let likeButton = UIButton()
    let likeCountLabel = UILabel()
    let contentImage = UIImageView()
    
    var hasContentImage: Bool!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
        
        /// Snapkit 설치하기 귀찮아서 하다가 큰 코 다치는 중인 상황
        /// 결국 snapkit을 설치한 상황
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
////        if hasContentImage == false {
////            noImageSetupLayout()
////        } else {
////            imageSetupLayout()
////        }
//    }
    
//    static func fittingSize(availableHeight: CGFloat, contentImage: String?) -> CGSize {
//        let cell = ContentCVC()
////        cell.configure(name: name)
//        cell.layoutSubviews()
//        
//        let targetSize = CGSize(width: UIView.layoutFittingCompressedSize.width, height: availableHeight)
//        return cell.contentView.systemLayoutSizeFitting(targetSize, withHorizontalFittingPriority: .fittingSizeLevel, verticalFittingPriority: .required)
//    }
    
    func configUI() {
        charBackground.backgroundColor = .black
        charBackground.layer.cornerRadius = 20
        
        charImage.backgroundColor = .systemPink
        charImage.layer.cornerRadius = 50
        
        nameLabel.text = "냠냐리냠ㅁ"
        timeLabel.text = "5분 전"
        
        charNameLabel.text = "뭘봐요불만있어여?"
        contentLabel.text = "오늘 떡볶이를 먹었는데 정말 맛있었다. 떡볶이는 세상에서 제일 맛있는 음식이다. 인정."
        contentLabel.lineBreakMode = .byWordWrapping
        contentLabel.numberOfLines = 2
        /// contentImage
        
        likeButton.backgroundColor = .gray
        likeCountLabel.text = "15"
    }
    
    func imageSetupLayout() {
        addSubview(charBackground)
        addSubview(charImage)
        addSubview(nameLabel)
        addSubview(timeLabel)
        addSubview(charNameLabel)
        addSubview(contentLabel)
        addSubview(contentImage)
        addSubview(likeButton)
        addSubview(likeCountLabel)
        
        charBackground.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(18)
            make.width.height.equalTo(50)
        }
        
        charImage.snp.makeConstraints { make in
            make.center.equalTo(charBackground.snp.center)
            make.width.height.equalTo(46)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalTo(charBackground.snp.trailing).offset(12)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
            make.leading.equalTo(charBackground.snp.trailing).offset(12)
        }
        
        charNameLabel.snp.makeConstraints { make in
            make.top.equalTo(charBackground.snp.bottom).offset(21)
            make.leading.trailing.equalToSuperview().inset(18)
//            make.height.equalTo(36)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(charNameLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(18)
//            make.width.equalTo(300)
            make.height.equalTo(50)
        }
        
        // image
        contentImage.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(18)
            make.height.equalTo(164)
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(contentImage.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(18)
            make.bottom.equalToSuperview().inset(17)
        }
        
        likeCountLabel.snp.makeConstraints { make in
            make.top.equalTo(contentImage.snp.bottom).offset(16)
            make.leading.equalTo(likeButton.snp.trailing).offset(2)
            make.bottom.equalToSuperview().inset(18)
        }
    }
    
    func noImageSetupLayout() {
        addSubview(charBackground)
        addSubview(charImage)
        addSubview(nameLabel)
        addSubview(timeLabel)
        addSubview(charNameLabel)
        addSubview(contentLabel)
//        addSubview(contentImage)
        addSubview(likeButton)
        addSubview(likeCountLabel)
        
        charBackground.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(18)
            make.width.height.equalTo(50)
        }
        
        charImage.snp.makeConstraints { make in
            make.center.equalTo(charBackground.snp.center)
            make.width.height.equalTo(46)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalTo(charBackground.snp.trailing).offset(12)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
            make.leading.equalTo(charBackground.snp.trailing).offset(12)
        }
        
        charNameLabel.snp.makeConstraints { make in
            make.top.equalTo(charBackground.snp.bottom).offset(21)
            make.leading.trailing.equalToSuperview().offset(18)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(charNameLabel.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(18)
//            make.height.equalTo(36)
            make.height.equalTo(50)
        }
        
        likeButton.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(18)
            make.bottom.equalToSuperview().inset(17)
        }
        
        likeCountLabel.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(16)
            make.leading.equalTo(likeButton.snp.trailing).offset(2)
            make.bottom.equalToSuperview().inset(18)
        }
    }
}
