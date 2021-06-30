//
//  CustomButton.swift
//  ComponentExample
//
//  Created by SHIN YOON AH on 2021/06/29.
//

import UIKit

class CustomButton: UIButton {

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
        setTitleColor(.systemTeal, for: .normal)
        
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemTeal.cgColor
    }
    
    // MARK: - 외부에서 쓰이는 함수
    func changeColor(color: UIColor) {
        setTitleColor(color, for: .normal)
        layer.borderColor = color.cgColor
    }
}
