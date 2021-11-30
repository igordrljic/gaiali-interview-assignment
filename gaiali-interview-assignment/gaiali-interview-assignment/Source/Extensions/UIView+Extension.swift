//
//  UIView.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 26.11.21..
//

import UIKit

extension UIView {
    
    var autolayoutView: Self {
        translatesAutoresizingMaskIntoConstraints = false
        return self
    }
    
    func setApectRatioConstraint(_ ratio: CGFloat) {
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: .height,
                                            relatedBy: .equal,
                                            toItem: self,
                                            attribute: .width,
                                            multiplier: ratio,
                                            constant: 0)
        addConstraint(constraint)
    }
}
