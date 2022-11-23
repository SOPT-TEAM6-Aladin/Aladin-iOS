//
//  BasketVC.swift
//  Aladin-iOS
//
//  Created by devxsby on 2022/11/15.
//

import UIKit

final class BasketVC: UITabBarController {
    
    // MARK: - UI Components
    
    // 네비 뷰
    private let naviView = UIView()
    private let backBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        $0.tintColor = .black
    }
    private let basketLabel = UILabel().then {
        $0.text = "장바구니"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
}

extension BasketVC {
    
    //MARK: - setLayout
    
    func setLayout() {
        
        //MARK: - addSubViews
        
        view.addSubviews(naviView)
        naviView.addSubviews(backBtn, basketLabel)
        
        //MARK: - naviViewLayout
        naviView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(48)
        }
        backBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.height.width.equalTo(24)
        }
        basketLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}
