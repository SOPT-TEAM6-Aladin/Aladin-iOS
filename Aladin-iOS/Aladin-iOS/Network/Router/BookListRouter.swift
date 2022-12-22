//
//  BookListRouter.swift
//  Aladin-iOS
//
//  Created by JH on 2022/12/16.
//

import Foundation
import UIKit

import Moya

enum BookListRouter {
    case BookList
}

extension BookListRouter: TargetType {
    var baseURL: URL {
        return URL(string: APIConstants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .BookList:
            return "/book"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .BookList:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .BookList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}


