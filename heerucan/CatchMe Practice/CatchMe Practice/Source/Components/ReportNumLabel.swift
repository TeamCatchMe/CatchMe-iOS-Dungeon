//
//  ReportNumLabel.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/06/29.
//

import UIKit

class ReportNumLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(numText: String) {
        super.init(frame: .zero)
        configLabelStyle(numText: numText)
    }
    
    private func configLabelStyle(numText: String) {
        text = numText
        textColor = .white
        font = .systemFont(ofSize: 20, weight: .bold)
    }
}
