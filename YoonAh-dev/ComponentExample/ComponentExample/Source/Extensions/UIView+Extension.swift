//
//  UIView+Extension.swift
//  ComponentExample
//
//  Created by SHIN YOON AH on 2021/06/29.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}
