//
//  QuadPageControl.swift
//  MainLottieSample
//
//  Created by SHIN YOON AH on 2021/07/01.
//

import UIKit

class QuadPageControl: UIPageControl {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard !subviews.isEmpty else { return }
        
        let spacing: CGFloat = 3
        
        let width: CGFloat = 15
        
        let height = spacing
        
        var total: CGFloat = 0
        
        for view in subviews {
            view.layer.cornerRadius = 0
            view.frame = CGRect(x: total, y: frame.size.height / 2 - height / 2, width: width,height: height)
            total += width + spacing
        }
        
        total -= spacing
        
        frame.origin.x = frame.origin.x + frame.size.width / 2 - total / 2
        frame.size.width = total
    }
}
