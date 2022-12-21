//
//  BookDetailResponseDto.swift
//  Aladin-iOS
//
//  Created by 김인영 on 2022/11/28.
//

import Foundation

// MARK: - Welcome
struct BookDetailResponseDTO: Codable {
    let status: Int
    let message: String
    let data: DetailData
}

// MARK: - DataClass
struct DetailData: Codable {
    let id: Int
    let name: String
    let thumbnail, cover: String
    let description, summary, author, painter: String
    let intro, publisher: String
    let price, discount_rate: Int
    let content: String
    let point: Int
    let topic, pick, like: Bool
    let likeCount: Int
}
