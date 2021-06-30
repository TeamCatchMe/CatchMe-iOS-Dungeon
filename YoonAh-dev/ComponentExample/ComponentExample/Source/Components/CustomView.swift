//
//  CustomView.swift
//  ComponentExample
//
//  Created by SHIN YOON AH on 2021/06/29.
//

import UIKit

class CustomView: UIView {
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configViewStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configViewStyle() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)
        ])
        label.text = "custom view"
        
        backgroundColor = .systemGray
        layer.cornerRadius = 20
    }
    
    // MARK: - 외부에서 쓰이는 함수
    func changeView() {
        var frame = self.frame
        frame.origin = CGPoint(x: 100, y: 400)
        frame.size = CGSize(width: 400, height: 400)
        UIView.animate(withDuration: 1.0, animations: {
            self.frame = frame
            self.alpha = 0.5
            self.backgroundColor = .magenta
        })
    }
    
    func springView() {
        UIView.animateKeyframes(withDuration: 2.0,
                                delay: 0,
                                options: [.repeat, .autoreverse],
        animations: {
            self.frame = CGRect(x: 100, y: 400, width: 200, height: 200)
            self.backgroundColor = .systemRed
        }, completion: nil)
    }
}
