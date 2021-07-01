//
//  ReportStackView.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/06/29.
//

import UIKit

class ReportStackView: UIStackView {
    
    let reportNumLabel = ReportNumLabel()
    
    let reportLabel = ReportLabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configViewStyle()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setupAutoLayout
    
    func configViewStyle() {
        axis = .vertical
        spacing = 3
        alignment = .center
    }
    
}
