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
    private let bannerImageView = UIImageView().then {
        $0.image = ImageLiterals.Images.banner
    }
    private let categoryContainerView = UIView()
    private var editerChoiceContainerView =  EditerChoiceContainerView()
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
    
    private let korBookStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 8
    }
    
    private let korBookLabel = UILabel().then {
        $0.text = "국내도서"
        $0.textColor = .aladinGray6
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    private let korBookImage = UIImageView().then {
        $0.image = ImageLiterals.Icons.bookKor
    }
    
    private let foreignBookStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 14
    }
    
    private let foreignBookLabel = UILabel().then {
        $0.text = "외국도서"
        $0.textColor = .aladinGray6
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    private let foreignBookImage = UIImageView().then {
        $0.image = ImageLiterals.Icons.bookforeign
    }
    
    private let divideLineView = UIView()
    
    private let editerChoiceImageNextButton = UIButton().then {
        $0.setImage(ImageLiterals.Icons.bookNext, for: .normal)
    }
    
    private let hotBookImageNextButton = UIButton().then {
        $0.setImage(ImageLiterals.Icons.bookNext, for: .normal)
    }
    
    private let giftImageNextButton = UIButton().then {
        $0.setImage(ImageLiterals.Icons.bookNext, for: .normal)
    }
    
    private let goldStickerImage = UIImageView().then {
        $0.image = ImageLiterals.Icons.goldSticker
    }
    
    private let editerChoiceLabel = UILabel().then {
        $0.text = "편집장의 선택"
        $0.font = UIFont.systemFont(ofSize: 20)
    }
    
    private let hotBookLabel = UILabel().then {
        $0.text = "지금, 화제의 책!"
        $0.font = UIFont.systemFont(ofSize: 20)
    }
    
    private let giftLabel = UILabel().then {
        $0.text = "알라딘이 만든 사은품"
        $0.font = UIFont.systemFont(ofSize: 20)
    }
    
    

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(scrollView)
        
        scrollView.addSubviews(searchContainerView,bannerImageView,categoryContainerView,editerChoiceContainerView,hotBookContainerView,giftContainerView)
        
        searchContainerView.addSubviews(menuButton,barcodeButton,textFieldView)
        
        textFieldView.addSubviews(textFieldLabel,searchButton)
        
        categoryContainerView.addSubviews(korBookStackView,foreignBookStackView)
        korBookStackView.addSubviews(korBookImage,korBookLabel)
        foreignBookStackView.addSubviews(foreignBookImage,foreignBookLabel)
        
        editerChoiceContainerView.addSubviews(divideLineView,editerChoiceImageNextButton,goldStickerImage,editerChoiceLabel)
        
        hotBookContainerView.addSubviews(hotBookLabel,hotBookImageNextButton)
        
        giftContainerView.addSubviews(giftLabel,giftImageNextButton)
        
        //영역 확인용 색상 넣어본것들
//        searchContainerView.backgroundColor = .yellow
//        categoryContainerView.backgroundColor = .aladinBlue
//        hotBookContainerView.backgroundColor = .aladinPink2
//        giftContainerView.backgroundColor = .red
//
        
        textFieldView.backgroundColor = .aladinGray1
        divideLineView.backgroundColor = .aladinGray1
        
        // MARK: - 스크롤뷰, 서치뷰, 배너 Layout

        
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
        
        // MARK: - 카테고리뷰 Layout

        
        categoryContainerView.snp.makeConstraints { make in
            make.top.equalTo(bannerImageView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(209)
        }
        
        korBookStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(34)
            make.leading.equalToSuperview().offset(32)
            make.width.equalTo(52)
            make.bottom.equalToSuperview().inset(123)
        }
        
        korBookImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(24)
        }
        
        korBookLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        foreignBookStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(34)
            make.leading.equalToSuperview().offset(128)
            make.width.equalTo(52)
            make.bottom.equalToSuperview().inset(123)
        }
        
        foreignBookImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(24)
        }
        
        foreignBookLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        
        // MARK: - 편집장의 선택 Layout

        
        divideLineView.snp.makeConstraints { make in
            make.top.equalTo(categoryContainerView.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(4)
        }
        
        editerChoiceContainerView.snp.makeConstraints { make in
            make.top.equalTo(categoryContainerView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(330)
        }
        
        editerChoiceImageNextButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(divideLineView.snp.bottom).offset(28)
            make.width.height.equalTo(32)
        }
        
        goldStickerImage.snp.makeConstraints { make in
            make.centerY.equalTo(editerChoiceImageNextButton)
            make.leading.equalToSuperview().offset(20)
            make.width.equalTo(10)
            make.height.equalTo(16)
        }
        
        editerChoiceLabel.snp.makeConstraints { make in
            make.centerY.equalTo(editerChoiceImageNextButton)
            make.leading.equalTo(goldStickerImage.snp.trailing).offset(8)
        }
        
        // MARK: - 화제의 책! Layout

        hotBookContainerView.snp.makeConstraints { make in
            make.top.equalTo(editerChoiceContainerView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(343)
        }
        
        hotBookLabel.snp.makeConstraints { make in
            make.centerY.equalTo(hotBookImageNextButton)
            make.leading.equalToSuperview().offset(20)
        }
        
        hotBookImageNextButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(32)
        }
        
        // MARK: - 사은품 Layout

        
        giftContainerView.snp.makeConstraints { make in
            make.top.equalTo(hotBookContainerView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(279)
            make.bottom.equalToSuperview()
        }
        
        giftLabel.snp.makeConstraints { make in
            make.centerY.equalTo(giftImageNextButton)
            make.leading.equalToSuperview().offset(20)
        }
        
        giftImageNextButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().inset(20)
            make.width.height.equalTo(32)
        }
    }
}
