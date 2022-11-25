//
//  ListTVCTableViewCell.swift
//  Aladin-iOS
//
//  Created by JH on 2022/11/25.
//

import UIKit
import SnapKit
import Then

final class ListTVC: UITableViewCell {

    
    // MARK: - Identifier
    
    static let identifier = "ListTVC"
    
    // MARK: - UI Components
    
    private let listName = UILabel().then {
        $0.font = UIFont.font(.pretendardSemiBold, ofSize: 18)
        $0.textColor = .aladinGray6
    }
    
    private let moreButton = UIButton().then {
        $0.setBackgroundImage(ImageLiterals.Icons.more3, for: .normal)
    }
    
    private let listImage = UIImageView()

    
    // MARK: - View Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions


extension ListTVC {
    
    private func setLayout () {
        
        contentView.addSubviews(listName,moreButton,listImage)
        
        listName.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.leading.equalToSuperview().offset(20)
        }
        
        moreButton.snp.makeConstraints {
            $0.centerY.equalTo(listName)
            $0.trailing.equalToSuperview().inset(20)
            $0.width.height.equalTo(24)
        }
        
        listImage.snp.makeConstraints {
            $0.top.equalTo(moreButton.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(105)
        }
    }
    
    func dataBind(model: ListModel) {
        listName.text = model.listTitle
        listImage.image = UIImage(named: model.image)
    }
}
