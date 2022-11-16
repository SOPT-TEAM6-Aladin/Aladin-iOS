//
//  BookDetailVC.swift
//  Aladin-iOS
//
//  Created by 김인영 on 2022/11/16.
//

import UIKit

class BookDetailVC: UIViewController {

    //MARK: - UI Components
    
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
        contentScrollView.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
}