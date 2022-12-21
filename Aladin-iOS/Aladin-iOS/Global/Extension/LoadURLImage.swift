//
//  LoadURLImage.swift
//  Aladin-iOS
//
//  Created by 김인영 on 2022/11/28.
//

import UIKit

extension UIImageView {
    /// img URL에서 이미지를 로드하는 함수입니다.
    func loadURLImage(_ url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
