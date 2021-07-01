//
//  PageControl.swift
//  MainLottieSample
//
//  Created by SHIN YOON AH on 2021/07/01.
//

import UIKit

class PageControl: UIView {
    var pages: Int = 0 {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsDisplay()
        }
    }
    var selectedPage: Int = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    var dotColor = UIColor.lightGray {
        didSet {
            setNeedsDisplay()
        }
    }
    var selectedColor = UIColor.init(red: 234/255, green: 69/255, blue: 121/255, alpha: 1.0) {
        didSet {
            setNeedsDisplay()
        }
    }
    
    private let dotSize: CGFloat = 6
    private let selectedDotSize: CGFloat = 18
    private let spacing: CGFloat = 7
    
    init() {
        super.init(frame: .zero)
        isOpaque = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override var intrinsicContentSize: CGSize {
        let width = CGFloat(pages) * dotSize + CGFloat(pages - 1) * spacing
        let height = dotSize
        return CGSize(width: width, height: height)
    }
    
    override func draw(_ rect: CGRect) {
        (0..<pages).forEach { page in
            var center = CGPoint(x: 0, y: 0)
            let currentDotSize = (page == selectedPage ? selectedDotSize : dotSize)
            (page == selectedPage ? selectedColor : dotColor).setFill()
            
            if page > selectedPage {
                center = CGPoint(x: rect.minX + (dotSize + spacing) * CGFloat(page) + (currentDotSize + spacing), y: rect.midY)
            } else {
                center = CGPoint(x: rect.minX + (dotSize + spacing) * CGFloat(page), y: rect.midY)
            }

            let size = CGSize(width: currentDotSize, height: 6)
            let rect = CGRect(origin: center, size: size)
            UIBezierPath(roundedRect: rect, cornerRadius: 3).fill()
        }
    }
}
