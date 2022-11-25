//
//  BasketFooterView.swift
//  Aladin-iOS
//
//  Created by 김인영 on 2022/11/25.
//

import UIKit
import SnapKit
import Then

class BasketFooterView: UITableViewHeaderFooterView {
    
    static let identifier = "BasketFooterView"
    
    private let divider1 = UIView().then {
        $0.backgroundColor = .aladinGray1
    }
    
    private let priceLabel = UILabel().then {
        $0.text = "상품금액"
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
        $0.textColor = .aladinGray6
    }
    
    private let price = UILabel().then {
        $0.text = "10,800원"
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
        $0.textColor = .black
    }
    
    private let deliveryPriceLabel = UILabel().then {
        $0.text = "배송비"
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
        $0.textColor = .aladinGray6
    }
    
    private let deliveryPrice = UILabel().then {
        $0.text = "0원"
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
        $0.textColor = .black
    }
    
    private let divider2 = UIView().then {
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
    
    private func setLayout() {
        addSubviews(
            divider1,
            priceLabel,
            price,
            deliveryPriceLabel,
            deliveryPrice,
            divider2
        )
        
        divider1.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(4)
        }
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(divider1.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(20)
        }
        price.snp.makeConstraints {
            $0.centerY.equalTo(priceLabel)
            $0.trailing.equalToSuperview().inset(20)
        }
        deliveryPriceLabel.snp.makeConstraints {
            $0.top.equalTo(price.snp.bottom).offset(16)
            $0.leading.equalTo(priceLabel)
        }
        deliveryPrice.snp.makeConstraints {
            $0.centerY.equalTo(deliveryPriceLabel)
            $0.trailing.equalTo(price)
        }
        divider2.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(4)
        }
    }
}
