//
//  HotBookCVC.swift
//  Aladin-iOS
//
//  Created by JH on 2022/11/23.
//

import UIKit
import SnapKit
import Then

class HotBookCVC: UICollectionViewCell {
    
    private let bookSampleImageView = UIImageView()
       
    
    
    // MARK: - Life Cycles

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .clear
        setLayout()
    }
        
    func dataBind(image : UIImage) {
        bookSampleImageView.image = image
    }
        
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubviews(bookSampleImageView)
        
        bookSampleImageView.snp.makeConstraints { make in
            make.top.equalToSuperview()
        }
    }
}

