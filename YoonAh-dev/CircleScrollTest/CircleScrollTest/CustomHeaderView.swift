//
//  CustomHeaderView.swift
//  CircleScrollTest
//
//  Created by SHIN YOON AH on 2021/06/29.
//

import UIKit

class CustomHeaderView: UIView {
    var imageView = UIImageView()
    var colorView = UIView()
    var bgColor = UIColor.init(red: 234/255, green: 69/255, blue: 121/255, alpha: 1.0)
    
    var heightConstraint: NSLayoutConstraint!
    var widthConstraint: NSLayoutConstraint!
    var topConstraint: NSLayoutConstraint!
    
    var backHeight: NSLayoutConstraint!
    var backWidth: NSLayoutConstraint!
    var backTop: NSLayoutConstraint!
    
    override init(frame:CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        self.backgroundColor = UIColor.black
        
        colorView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(colorView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        
        heightConstraint = imageView.heightAnchor.constraint(equalToConstant: 116)
        heightConstraint.isActive = true
        
        widthConstraint = imageView.widthAnchor.constraint(equalToConstant: 135)
        widthConstraint.isActive = true
        
        topConstraint = imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 166)
        topConstraint.isActive = true
        
        backTop = colorView.topAnchor.constraint(equalTo: self.topAnchor)
        backTop.isActive = true
        
        backWidth = colorView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width)
        backWidth.isActive = true
        
        backHeight = colorView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width)
        backHeight.isActive = true
            
        let constraints:[NSLayoutConstraint] = [
            imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            colorView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        imageView.image = UIImage(named: "2D")
        imageView.contentMode = .scaleAspectFill
        
        colorView.backgroundColor = bgColor
    }
}

