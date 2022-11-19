//
//  BookCVC.swift
//  Aladin-iOS
//
//  Created by JH on 2022/11/18.
//

import UIKit
import SnapKit
import Then

class BookCVC: UICollectionViewCell {
    
    private let editerChoiceImageView = UIImageView()
    
    
    
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        contentView.backgroundColor = .clear
        editerChoiceImageView.contentMode = .scaleAspectFill
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func dataBind(image : UIImage) {
        editerChoiceImageView.image = image
    }
    
    private func setLayout() {
        contentView.addSubview(editerChoiceImageView)
        
        editerChoiceImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
