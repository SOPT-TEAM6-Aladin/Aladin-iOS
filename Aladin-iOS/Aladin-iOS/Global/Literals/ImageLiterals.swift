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
    
    struct Images {
        static var banner: UIImage { .load(named: "banner") }
        
        static var gradientBook1: UIImage { .load(named: "book1") }
        static var gradientBook2: UIImage { .load(named: "book2") }
        static var gradientBook3: UIImage { .load(named: "book3") }
        
        static var sampleBook1: UIImage { .load(named: "bookSample1") }
        static var sampleBook2: UIImage { .load(named: "bookSample2") }
        static var sampleBook3: UIImage { .load(named: "bookSample3") }
        
        static var bottomBook: UIImage { .load(named: "bottomBook") }
        
        static var detailBookSample: UIImage { .load(named: "detailBookSample") }
        
        static var detailBookImage1: UIImage { .load(named: "book_image1") }
        static var detailBookImage2: UIImage { .load(named: "book_image2") }
        
        static var aladinLogo: UIImage { .load(named: "aladinLogo") }
        static var aladinLogoLetter: UIImage { .load(named: "logo_letter") }
    }
    
    struct Icons {
        static var bookBack: UIImage { .load(named: "ic_bookback") }
        static var bookNext: UIImage { .load(named: "ic_booknext") }
        
        static var more: UIImage { .load(named: "ic_more") }
        static var more2: UIImage { .load(named: "ic_more_2") }
        static var more3: UIImage { .load(named: "ic_more_3") }
        
        static var menu: UIImage { .load(named: "ic_menu") }
        static var search: UIImage { .load(named: "ic_search") }
        static var barcode: UIImage { .load(named: "ic_barcode") }
        
        static var gift: UIImage { .load(named: "ic_gift") }
        static var profile: UIImage { .load(named: "ic_profile") }
        static var carpet: UIImage { .load(named: "ic_carpet") }
        
        static var bookKor: UIImage { .load(named: "ic_book_kor") }
        static var bookforeign: UIImage { .load(named: "ic_book_foreign") }
        static var ebook: UIImage { .load(named: "ic_ebook") }
        static var goods: UIImage { .load(named: "ic_goods") }
        static var new: UIImage { .load(named: "ic_new") }
        static var best: UIImage { .load(named: "ic_best") }
        static var event: UIImage { .load(named: "ic_event") }
        static var category: UIImage { .load(named: "ic_category") }
        
        static var heart: UIImage { .load(named: "ic_heart") }
        static var grayHeartCircle: UIImage { .load(named: "ic_heartcircle-unfilled") }
        static var pinkHeartCircle: UIImage { .load(named: "ic_heartcircle") }
        
        static var star: UIImage { .load(named: "ic_star") }
        static var halfStar: UIImage { .load(named: "ic_half-star") }

        
        static var goldSticker: UIImage { .load(named: "goldSticker") }
        static var silverSticker: UIImage { .load(named: "silverSticker") }
        
        static var checkActive: UIImage {
            .load(named: "ic_check_active")
        }
        static var checkInActive: UIImage {
            .load(named: "ic_check_inactive")
        }
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
