//
//  test.swift
//  CarouselEffectTest
//
//  Created by SHIN YOON AH on 2021/07/23.
//

import UIKit

class test: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 300),
            self.widthAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
