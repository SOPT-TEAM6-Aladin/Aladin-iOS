//
//  BookRouter.swift
//  Aladin-iOS
//
//  Created by devxsby on 2022/11/26.
//

import Foundation

import Moya

enum BookRouter {
    case fetchBookLike(bookId: Int)
    case fetchBookDetail(id: Int)
}

extension BookRouter: TargetType {
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .fetchBookLike(let bookId):
            return "\(APIConstants.book)/\(bookId)/like"
        case .fetchBookDetail(let id):
            return "\(APIConstants.book)/\(id)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .fetchBookLike:
            return .put
        case .fetchBookDetail:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .fetchBookLike(let bookId):
            return .requestParameters(parameters: [
                "bookId": bookId], encoding: URLEncoding.queryString)
        case .fetchBookDetail(let id):
            return .requestParameters(parameters: [
                "id": id], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json",
                "userId": "2"]
    }
    
}
