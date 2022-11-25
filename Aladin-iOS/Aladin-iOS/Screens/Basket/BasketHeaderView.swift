//
//  BasketHeaderView.swift
//  Aladin-iOS
//
//  Created by 김인영 on 2022/11/25.
//

import UIKit
import SnapKit
import Then

class BasketHeaderView: UITableViewHeaderFooterView {
    
    static let identifier = "BasketHeaderView"
        
    private let checkbox = UIImageView().then {
        $0.image = ImageLiterals.Icons.checkActive
    }
    
    private let totalLabel = UILabel().then {
        $0.text = "전체"
        $0.font = .systemFont(ofSize: 15, weight: .medium)
    }
    
    private let divider = UIView().then {
        $0.backgroundColor = .aladinGray1
    }
    
    //MARK: - Life Cycle
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setLayout()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout(){
        addSubviews(checkbox, totalLabel, divider)
        
        checkbox.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.height.width.equalTo(24)
        }
        
        totalLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(checkbox.snp.trailing).offset(7)
        }
        
        divider.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(4)
        }
    }
}
