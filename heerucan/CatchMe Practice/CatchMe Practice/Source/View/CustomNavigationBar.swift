//
//  CustomNavigationBar.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/06/29.
//

import UIKit

class CustomNavigationBar: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Property
    
    let backButton = UIButton().then {
        $0.setImage(UIImage(named: "btnBack"), for: .normal)
    }
    
    let writeButton = UIButton().then {
        $0.setImage(UIImage(named: "btnWrite"), for: .normal)
    }
    
    // MARK: - setUpConfigure
    
    func setUpConfigure() {
        
        backgroundColor = .clear
        
        addSubviews([backButton, writeButton])
        
        backButton.snp.makeConstraints { (make) in
            make.top.equalTo(55)
            make.leading.equalTo(13)
        }

        writeButton.snp.makeConstraints { (make) in
            make.top.equalTo(55)
            make.trailing.equalTo(-14)
        }

    }
    
    
}
