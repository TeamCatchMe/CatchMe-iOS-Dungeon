//
//  BasicButton.swift
//  ComponentExample
//
//  Created by SHIN YOON AH on 2021/06/29.
//

import UIKit

class BasicButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String) {
        super.init(frame: .zero)
        configButtonStyle(title: title)
    }
    
    private func configButtonStyle(title: String) {
        setTitle(title, for: .normal)
        setTitleColor(.black, for: .normal)
    }
}
