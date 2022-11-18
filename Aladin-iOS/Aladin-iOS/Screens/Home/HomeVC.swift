//
//  HomeVC.swift
//  Aladin-iOS
//
//  Created by devxsby on 2022/11/15.
//

import UIKit
import SnapKit
import Then


final class HomeVC: UITabBarController {
    
    private let scrollView = UIScrollView()
    
    private let searchContainerView = UIView()
    private let bannerImageView = UIImageView()
    private let categoryContainerView = UIView()
    private let editerChoiceContainerView = UIView()
    private let hotBookContainerView = UIView()
    private let giftContainerView = UIView()
    
    private let menuButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.Icons.menu.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    private let barcodeButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.Icons.barcode.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    private let textFieldView = UIView().then {
        $0.layer.cornerRadius = 12
    }
    
    private let textFieldLabel = UILabel().then {
        $0.text = "'이달의 도서'를 검색해 보세요."
        $0.textColor = .aladinGray3
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    private let searchButton = UIButton(type: .system).then {
        $0.setImage(ImageLiterals.Icons.search.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(scrollView)
        
        scrollView.addSubviews(searchContainerView,bannerImageView,categoryContainerView,editerChoiceContainerView,hotBookContainerView,giftContainerView)
        
        searchContainerView.addSubviews(menuButton,barcodeButton,textFieldView)
        
        textFieldView.addSubviews(textFieldLabel,searchButton)
        
        //영역 확인용 색상 넣어본것들~
//        searchContainerView.backgroundColor = .yellow
//        categoryContainerView.backgroundColor = .aladinBlue
//        hotBookContainerView.backgroundColor = .aladinPink2
//        giftContainerView.backgroundColor = .red
//
        textFieldView.backgroundColor = .aladinGray1
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        searchContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(52)
        }
        
        menuButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        barcodeButton.snp.makeConstraints { make in
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.centerY.equalToSuperview()
        }
        
        bannerImageView.snp.makeConstraints { make in
            make.top.equalTo(searchContainerView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(119)
        }
        
        textFieldView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.equalToSuperview().inset(56)
            make.height.equalTo(31)
        }
        
        textFieldLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(14)
        }
        
        searchButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(12)
            make.width.height.equalTo(18)
        }
        
        categoryContainerView.snp.makeConstraints { make in
            make.top.equalTo(bannerImageView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(209)
        }
        
        editerChoiceContainerView.snp.makeConstraints { make in
            make.top.equalTo(categoryContainerView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(330)
        }
        
        hotBookContainerView.snp.makeConstraints { make in
            make.top.equalTo(editerChoiceContainerView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(343)
        }
        
        giftContainerView.snp.makeConstraints { make in
            make.top.equalTo(hotBookContainerView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(279)
            make.bottom.equalToSuperview()
        }
        
        bannerImageView.image = ImageLiterals.Images.banner
        
    }
    
    
}
