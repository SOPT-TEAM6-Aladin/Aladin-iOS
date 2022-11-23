//
//  MyPageVC.swift
//  Aladin-iOS
//
//  Created by devxsby on 2022/11/15.
//

import UIKit
import SnapKit
import Then

final class MyPageVC: UITabBarController {
    
    private let scrollView = UIScrollView()
    
    private let myInfoContainerView = UIView()
    private let tradeListContainerView = UIView()
    private let footerContainerView = UIView()
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        myInfoContainerView.backgroundColor = .aladinBlue2
        footerContainerView.backgroundColor = .red
        
        scrollView.addSubviews(myInfoContainerView,tradeListContainerView,footerContainerView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        myInfoContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(276)
        }
        
        tradeListContainerView.snp.makeConstraints { make in
            make.top.equalTo(myInfoContainerView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(541)
        }
        
        footerContainerView.snp.makeConstraints { make in
            make.top.equalTo(tradeListContainerView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(283)
            make.bottom.equalToSuperview()
        }
    }
}
