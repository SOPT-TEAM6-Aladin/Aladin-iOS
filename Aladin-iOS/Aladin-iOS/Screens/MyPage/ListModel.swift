//
//  ListModel.swift
//  Aladin-iOS
//
//  Created by JH on 2022/11/25.
//

import Foundation

struct ListModel {
    let listTitle: String
    let image: String
}


// MARK: - Variables

var dummyList: [ListModel] = [
    ListModel(listTitle: "주문 내역", image: "backFrame1"),
    ListModel(listTitle: "반품 / 교환 내역", image: "backFrame2"),
    ListModel(listTitle: "중고 팔기 내역", image: "backFrame3")
]
