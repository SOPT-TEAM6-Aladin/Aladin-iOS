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
    
    private let infoView = UIImageView().then {
        $0.image = ImageLiterals.Images.infoView
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 0, height: 4)
        $0.layer.shadowRadius = 5
        $0.layer.shadowOpacity = 0.1
    }
    
    private let silverSticker = UIImageView().then {
        $0.image = ImageLiterals.Icons.silverSticker
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        myInfoContainerView.backgroundColor = .aladinBlue2
        footerContainerView.backgroundColor = .red
        
        scrollView.addSubviews(myInfoContainerView,tradeListContainerView,footerContainerView)
        
        myInfoContainerView.addSubviews(infoView,silverSticker)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        myInfoContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(276)
        }
        
        infoView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(28)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(48)
        }
        
        silverSticker.snp.makeConstraints {
            $0.top.equalTo(infoView)
            $0.trailing.equalTo(infoView).inset(24)
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
