//
//  File.swift
//  Aladin-iOS
//
//  Created by JH on 2022/12/16.
//

import Foundation

// MARK: - Welcome
struct BookListResponseDTO: Codable {
    let status: Int
    let message: String
    let data: BookListData
}

// MARK: - DataClass
struct BookListData: Codable {
    let topic, pick: [BookListDataArray]
}

// MARK: - Pick
struct BookListDataArray: Codable {
    let id: Int
    let name, thumbnail: String
    let cover: String
    let pickDescription, summary, author, painter: String
    let intro, publisher: String
    let price, discountRate: Int
    let content: String
    let point: Int
    let topic, pick: Bool

    enum CodingKeys: String, CodingKey {
        case id, name, thumbnail, cover
        case pickDescription = "description"
        case summary, author, painter, intro, publisher, price
        case discountRate = "discount_rate"
        case content, point, topic, pick
    }
}
