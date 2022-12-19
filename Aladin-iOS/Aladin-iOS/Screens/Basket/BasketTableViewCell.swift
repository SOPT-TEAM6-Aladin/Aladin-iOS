//
//  BasketTableViewCell.swift
//  Aladin-iOS
//
//  Created by 김인영 on 2022/11/23.
//

import UIKit
import SnapKit
import Then

class BasketTableViewCell: UITableViewCell {
    
    static let identifier = "BasketTableViewCell"
    
    lazy var checkbox = UIButton().then {
        $0.isSelected = true
        $0.setImage(ImageLiterals.Icons.checkActive, for: .selected)
        $0.setImage(ImageLiterals.Icons.checkInActive, for: .normal)
        $0.addTarget(self, action: #selector(checkBtnDidTap), for: .touchUpInside)
    }
    var image = UIImageView()
    var name = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
        $0.textColor = UIColor.aladinGray6
    }
    var price = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = UIColor.aladinGray6
    }
    var quantityMinus = UIButton().then {
        $0.setTitle("-", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        $0.setTitleColor(.black, for: .normal)
    }
    var quantity = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .semibold)
    }
    var quantityPlus = UIButton().then {
        $0.setTitle("+", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        $0.setTitleColor(.black, for: .normal)
    }
    var deliveryInfo = UILabel().then {
        $0.text = "11월 7일(월) 밤 11시 잠들기전 배송"
        $0.font = .systemFont(ofSize: 12, weight: .regular)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func checkBtnDidTap() {
        checkbox.isSelected.toggle()
    }
}

extension BasketTableViewCell {
    func setLayout() {
        contentView.addSubviews(
            checkbox,
            image,
            name,
            price,
            quantityMinus,
            quantity,
            quantityPlus,
            deliveryInfo
        )
        checkbox.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(20)
            $0.height.width.equalTo(24)
        }
        image.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(checkbox.snp.trailing).offset(8)
            $0.height.equalTo(100.adjusted)
            $0.width.equalTo(68.adjusted)
        }
        name.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalTo(image.snp.trailing).offset(16)
        }
        price.snp.makeConstraints {
            $0.top.equalTo(name.snp.bottom).offset(4)
            $0.leading.equalTo(name)
        }
        quantityMinus.snp.makeConstraints {
            $0.top.equalTo(price.snp.bottom).offset(15)
            $0.leading.equalTo(image.snp.trailing).offset(16)
            $0.height.equalTo(19)
        }
        quantity.snp.makeConstraints {
            $0.top.equalTo(price.snp.bottom).offset(18)
            $0.leading.equalTo(quantityMinus.snp.trailing).offset(10)
        }
        quantityPlus.snp.makeConstraints {
            $0.top.equalTo(quantityMinus)
            $0.leading.equalTo(quantity.snp.trailing).offset(18)
            $0.height.equalTo(19)
        }
        deliveryInfo.snp.makeConstraints {
            $0.top.equalTo(quantity.snp.bottom).offset(15)
            $0.leading.equalTo(name)
        }
    }
    func dataBind(model: BasketModel) {
        image.image = model.image
        name.text = model.name
        price.text = "\(model.price)원"
        quantity.text = model.quantity
        deliveryInfo.text = model.deliveryInfo
        checkbox.isSelected = model.ischecked
    }
}
