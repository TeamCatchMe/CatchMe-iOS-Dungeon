//
//  categoriesCVC.swift
//  LookViewPractice
//
//  Created by 양수빈 on 2021/09/04.
//

import UIKit

class categoriesCVC: UICollectionViewCell {
    static let identifier = "categoriesCVC"
    
    var textLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(textLabel)
        
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        textLabel.text = "종류"
        
        textLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        textLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool{
            didSet{
                if isSelected{
                    backgroundColor = .lightGray.withAlphaComponent(100/255)
                    textLabel.textColor = .black
                }
                else{
                    backgroundColor = .clear
                    textLabel.textColor = .lightGray
                }
            }
        }
}
