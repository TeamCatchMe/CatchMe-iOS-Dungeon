//
//  ReportLabel.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/06/29.
//

import UIKit

class ReportLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(reportText: String) {
        super.init(frame: .zero)
        configLabelStyle(reportText: reportText)
    }
    
    private func configLabelStyle(reportText: String) {
        text = reportText
        textColor = .textGray
        font = .systemFont(ofSize: 14, weight: .regular)
    }
    
}
