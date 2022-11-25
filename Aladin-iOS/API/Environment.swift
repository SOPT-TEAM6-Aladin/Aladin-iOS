//
//  Environment.swift
//  Aladin-iOS
//
//  Created by 김인영 on 2022/11/25.
//

import Foundation

struct Environment {
    static let baseURL = (Bundle.main.infoDictionary?["BASE_URL"] as! String).replacingOccurrences(of: " ", with: "")
}
