//
//  HeaderView.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/06/29.
//

import UIKit

class HeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    let backgroundView = UIView().then {
        $0.backgroundColor = .mainPink
    }

    let characterImageView = UIImageView().then {
        $0.image = UIImage(named: "iconCharacter")
    }

    // MARK: - setUpConfigure
    
    func setUpConfigure() {
        
        clipsToBounds = true
        
        backgroundColor = .mainBackground
        
        addSubviews([backgroundView, characterImageView])
        
        
        backgroundView.snp.makeConstraints { (make) in
            make.height.width.equalTo(UIScreen.main.bounds.width)
            make.centerX.centerY.equalToSuperview()
        }
        
        characterImageView.snp.makeConstraints { (make) in
            make.top.equalTo(172)
            make.centerX.equalToSuperview()
            make.width.equalTo(135)
            make.height.equalTo(116)
        }
    }
    
}
