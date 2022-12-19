//
//  BasketModel.swift
//  Aladin-iOS
//
//  Created by 김인영 on 2022/11/23.
//

import Foundation
import UIKit

struct BasketModel {
    var image : UIImage!
    var name : String
    var price : Int
    var quantity : String
    var deliveryInfo : String
    var ischecked: Bool
}

let basketDummy : [BasketModel] = [
    BasketModel(image: UIImage(named: "book_image1"), name: "기소영의 친구들", price: 10800, quantity: "1", deliveryInfo: "11월 7일(월) 밤 11시 잠들기전 배송", ischecked: true),
    BasketModel(image: UIImage(named: "book_image2"), name: "피아노 치는 할머니가 될래", price: 14400, quantity: "1", deliveryInfo: "11월 7일(월) 밤 11시 잠들기전 배송", ischecked: false),
        BasketModel(image: UIImage(named: "book_image1"), name: "기소영의 친구들2", price: 20800, quantity: "1", deliveryInfo: "11월 8일(화) 아침 11시전 배송", ischecked: true),
    BasketModel(image: UIImage(named: "book_image2"), name: "피아노 치는 할아버지가 될래", price: 18400, quantity: "1", deliveryInfo: "11월 8일(화) 아침 11시전 배송", ischecked: false)
]
