//
//  CustomCollectionViewCell.swift
//  PagingController
//
//  Created by 양수빈 on 2021/07/01.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    let imageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalTo(133)
            make.height.equalTo(114)
//            make.leading.equalToSuperview().offset(100)
//            make.trailing.equalToSuperview().offset(-100)
//            make.top.equalToSuperview().offset(300)
//            make.bottom.equalToSuperview().offset(-300)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
