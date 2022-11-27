//
//  BookLikeResponseDTO.swift
//  Aladin-iOS
//
//  Created by devxsby on 2022/11/26.
//

import Foundation

struct BookLikeResponseDTO: Codable {
    let status: Int
    let success: Bool?
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id, userID, bookID, likeCount: Int
    let hasLike: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case bookID = "book_id"
        case likeCount, hasLike
    }
}
