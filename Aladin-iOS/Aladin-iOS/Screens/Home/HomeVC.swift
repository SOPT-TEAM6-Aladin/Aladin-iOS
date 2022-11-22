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
    private let hotBookContainerView = HotBookContainerView()
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
    
    private let eBookStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 12
    }
    
    private let eBookLabel = UILabel().then {
        $0.text = "e Book"
        $0.textColor = .aladinGray6
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    private let eBookImage = UIImageView().then {
        $0.image = ImageLiterals.Icons.ebook
    }
    
    private let goodsStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 14
    }
    
    private let goodsLabel = UILabel().then {
        $0.text = "알라딘 굿즈"
        $0.textColor = .aladinGray6
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    private let goodsImage = UIImageView().then {
        $0.image = ImageLiterals.Icons.goods
    }
    
    private let newStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 15
    }
    
    private let newLabel = UILabel().then {
        $0.text = "신간도서"
        $0.textColor = .aladinGray6
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    private let newImage = UIImageView().then {
        $0.image = ImageLiterals.Icons.new
    }
    
    private let bestStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 17
    }
    
    private let bestLabel = UILabel().then {
        $0.text = "베스트"
        $0.textColor = .aladinGray6
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    private let bestImage = UIImageView().then {
        $0.image = ImageLiterals.Icons.best
    }
    
    private let eventStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 15
    }
    
    private let eventLabel = UILabel().then {
        $0.text = "이벤트"
        $0.textColor = .aladinGray6
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    private let eventImage = UIImageView().then {
        $0.image = ImageLiterals.Icons.event
    }
    
    private let categoryStackView = UIStackView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 17
    }
    
    private let categoryLabel = UILabel().then {
        $0.text = "분야찾기"
        $0.textColor = .aladinGray6
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    private let categoryImage = UIImageView().then {
        $0.image = ImageLiterals.Icons.category
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
    
    private let bottomBookImage = UIImageView().then {
        $0.image = ImageLiterals.Images.bottomBook
    }
    

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews(scrollView)
        
        scrollView.addSubviews(searchContainerView,bannerImageView,categoryContainerView,editerChoiceContainerView,hotBookContainerView,giftContainerView)
        
        searchContainerView.addSubviews(menuButton,barcodeButton,textFieldView)
        
        textFieldView.addSubviews(textFieldLabel,searchButton)
        
        categoryContainerView.addSubviews(korBookStackView,foreignBookStackView,eBookStackView,goodsStackView,newStackView,bestStackView,eventStackView,categoryStackView)
        
        korBookStackView.addSubviews(korBookImage,korBookLabel)
        foreignBookStackView.addSubviews(foreignBookImage,foreignBookLabel)
        eBookStackView.addSubviews(eBookImage,eBookLabel)
        goodsStackView.addSubviews(goodsImage,goodsLabel)
        newStackView.addSubviews(newImage,newLabel)
        bestStackView.addSubviews(bestImage,bestLabel)
        eventStackView.addSubviews(eventImage,eventLabel)
        categoryStackView.addSubviews(categoryImage,categoryLabel)

        
        editerChoiceContainerView.addSubviews(divideLineView,editerChoiceImageNextButton,goldStickerImage,editerChoiceLabel)
        
        hotBookContainerView.addSubviews(hotBookLabel,hotBookImageNextButton)
        
        giftContainerView.addSubviews(giftLabel,giftImageNextButton,bottomBookImage)
        
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
            make.centerX.equalTo(categoryContainerView.snp.leading).offset(70)
            make.width.equalTo(42)
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
            make.centerX.equalTo(categoryContainerView.snp.leading).offset(154)
            make.width.equalTo(42)
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
        
        eBookStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.centerX.equalTo(categoryContainerView.snp.leading).offset(238)
            make.width.equalTo(38)
            make.bottom.equalToSuperview().inset(123)
        }
        
        eBookImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(28)
        }
        
        eBookLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        goodsStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(32)
            make.centerX.equalTo(categoryContainerView.snp.leading).offset(323)
            make.width.equalTo(55)
            make.bottom.equalToSuperview().inset(123)
        }
        
        goodsImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(24)
        }
        
        goodsLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        newStackView.snp.makeConstraints { make in
            make.centerX.equalTo(korBookStackView)
            make.width.equalTo(42)
            make.top.equalToSuperview().offset(118)
            make.bottom.equalToSuperview().inset(32)
        }
        
        newImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        newLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        bestStackView.snp.makeConstraints { make in
            make.centerX.equalTo(foreignBookStackView)
            make.width.equalTo(32)
            make.top.equalToSuperview().offset(118)
            make.bottom.equalToSuperview().inset(32)
        }
        
        bestImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(28)
        }
        
        bestLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        eventStackView.snp.makeConstraints { make in
            make.centerX.equalTo(eBookStackView)
            make.width.equalTo(32)
            make.top.equalToSuperview().offset(118)
            make.bottom.equalToSuperview().inset(32)
        }
        
        eventImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        
        eventLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        
        categoryStackView.snp.makeConstraints { make in
            make.centerX.equalTo(goodsStackView)
            make.width.equalTo(42)
            make.top.equalToSuperview().offset(118)
            make.bottom.equalToSuperview().inset(32)
        }
        
        categoryImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(28)
        }
        
        categoryLabel.snp.makeConstraints { make in
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
        
        bottomBookImage.snp.makeConstraints { make in
            make.top.equalTo(giftImageNextButton.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
    }
}
