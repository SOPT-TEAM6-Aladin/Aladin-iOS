//
//  ImageLiterals.swift
//  Aladin-iOS
//
//  Created by devxsby on 2022/11/15.
//

import UIKit

enum ImageLiterals {
    
    struct MainTBC {
        static var myPageTabIcn: UIImage { .load(named: "ic_my") }
        static var homeTabIcn: UIImage { .load(named: "ic_home") }
        static var basketTabIcn: UIImage { .load(named: "ic_basket") }
    }
    
}

extension UIImage {
    static func load(named imageName: String) -> UIImage {
        guard let image = UIImage(named: imageName, in: nil, compatibleWith: nil) else {
            return UIImage()
        }
        image.accessibilityIdentifier = imageName
        return image
    }
    
    func resize(to size: CGSize) -> UIImage {
        let image = UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
        return image
    }
}
