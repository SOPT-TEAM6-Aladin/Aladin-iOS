//
//  BookDetailVC.swift
//  Aladin-iOS
//
//  Created by 김인영 on 2022/11/16.
//

import UIKit
import SnapKit
import Then

class BookDetailVC: UIViewController {

    //MARK: - UI Components
    
    // 네비 뷰
    private let naviView = UIView()
    private let backBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        $0.tintColor = .black
    }
    private let searchBtn = UIButton().then{
        $0.setImage(UIImage(named: "ic_search"), for: .normal)
    }
    private let basketBtn = UIButton().then{
        $0.setImage(UIImage(systemName: "cart"), for: .normal)
        $0.tintColor = .black
    }
    
    // 스크롤 뷰
    private let contentScrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = true
    }
    
    private let contentView = UIView().then{
        $0.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
}

extension BookDetailVC {
    func setLayout() {
        view.addSubviews(contentScrollView, naviView)
        
        contentScrollView.addSubviews(contentView)
        naviView.addSubviews(backBtn, searchBtn, basketBtn)
        
        contentScrollView.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        naviView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(48)
        }
        
        backBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.height.width.equalTo(24)
        }
        
        searchBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(basketBtn.snp.leading).offset(-12)
            $0.height.width.equalTo(24)
        }
        
        basketBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-12)
            $0.height.width.equalTo(24)
        }
    }
}
