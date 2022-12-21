//
//  addComma.swift
//  Aladin-iOS
//
//  Created by 김인영 on 2022/11/28.
//

import Foundation

//MARK: - 천단위마다 ,표시
func addComma(value: Int) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    let result = numberFormatter.string(from: NSNumber(value: value)) ?? ""
    
    return result + "원"
}
