//
//  ReviewModel.swift
//  Aladin-iOS
//
//  Created by 김인영 on 2022/11/22.
//

import Foundation
import UIKit

struct ReviewModel {
    var image : UIImage!
    var name : String
    var date : String
    var content : String
}

let reviewDummy : [ReviewModel] = [
    ReviewModel(image: UIImage(named: "ic_profile"), name: "bo*****", date: "2022.11.11", content: "내용이 너무 인상깊었습니다. 이 책 추천드립니다~!"),
    ReviewModel(image: UIImage(named: "ic_profile"), name: "bo*****", date: "2022.11.11", content: "내용이 너무 인상깊었습니다. 이 책 추천드립니다~!"),
    ReviewModel(image: UIImage(named: "ic_profile"), name: "bo*****", date: "2022.11.11", content: "내용이 너무 인상깊었습니다. 이 책 추천드립니다~!")
]
