//
//  dayCell.swift
//  CustomCalendar
//
//  Created by SHIN YOON AH on 2021/07/01.
//

import UIKit

class dayCell: UICollectionViewCell {
    static let identifier = "dayCell"
    
    var dataLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(dataLabel)
        dataLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dataLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            dataLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
