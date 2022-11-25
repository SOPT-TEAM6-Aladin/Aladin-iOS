//
//  DetailResponseDto.swift
//  Aladin-iOS
//
//  Created by 김인영 on 2022/11/25.
//

import Foundation

struct DetailResponseDto: Codable {
    let status: Int
    let success: Bool
    let message: String
    let id: Int
    let name: String
    let intro: String
    let author: String
    let painter: String
    let like: Bool
    let likeCount: Int
    let price: Int
    let discountRate: Int
    let description: String
    let content: String
    let summary: String
}
