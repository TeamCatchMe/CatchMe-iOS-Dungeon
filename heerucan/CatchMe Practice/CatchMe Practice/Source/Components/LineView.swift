//
//  LineView.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/06/29.
//

import UIKit

class LineView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let lineView = UIView().then {
        $0.backgroundColor = .mainLine
    }
    
    private func setUpConfigure() {
        
        addSubview(lineView)
        
        lineView.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.leading.trailing.equalToSuperview()
        }
    }
}
