//
//  UIImageView+Extension.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 30.11.21..
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(with url: URL, completion: (() -> Void)? = nil) {
        kf.setImage(with: url) { _ in
            completion?()
        }
    }
    
    func setImage(with url: URL, placeholder: UIImage, completion: (() -> Void)? = nil) {
        kf.setImage(with: url, placeholder: placeholder) { _ in
            completion?()
        }
    }
}
