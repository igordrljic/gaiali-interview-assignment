//
//  IntrinsicSizeCollectionView.swift
//  gaiali-interview-assignment
//
//  Created by Igor Drljic on 30.11.21..
//

import Foundation
import UIKit

class IntrinsicSizeCollectionView: BaseCollectionView {
    var height: CGFloat
    
    override init(frame: CGRect, collectionViewLayout: UICollectionViewLayout) {
        self.height = frame.size.height
        super.init(frame: frame, collectionViewLayout: collectionViewLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: UIView.noIntrinsicMetric, height: height)
    }
}
