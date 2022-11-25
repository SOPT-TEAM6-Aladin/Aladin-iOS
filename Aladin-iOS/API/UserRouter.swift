//
//  UserRouter.swift
//  Aladin-iOS
//
//  Created by 김인영 on 2022/11/25.
//

import Foundation
import UIKit

import Moya

enum UserRouter {
    case detail(param: DetailResponseDto)
}

extension UserRouter: TargetType {
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    var baseURL: URL {
        return URL(string: Environment.baseURL)!
    }
    
    var path: String {
        switch self {
        case .detail(param: _):
            return "/book/1"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .detail(param: _):
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .detail(param: let param):
            //            return .requestJSONEncodable(param)
            return .requestParameters(parameters: try! param.asParameter(), encoding: JSONEncoding.default)
        }
    }
}
