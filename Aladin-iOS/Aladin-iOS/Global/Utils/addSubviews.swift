//
//  addSubviews.swift
//  Aladin-iOS
//
//  Created by devxsby on 2022/11/15.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
