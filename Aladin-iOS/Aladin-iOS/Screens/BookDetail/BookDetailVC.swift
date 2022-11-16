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
    
    private let searchBtn = UIButton().then {
        $0.setImage(UIImage(named: "ic_search"), for: .normal)
    }
    
    private let basketBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "cart"), for: .normal)
        $0.tintColor = .black
    }
    
    // 스크롤 뷰
    private lazy var contentScrollView = UIScrollView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        $0.showsVerticalScrollIndicator = true
    }
    
    //MARK: -
    
    // 책 상세정보 뷰
    private let bookInfoContainerView = UIView()
    private let bookImage = UIImageView().then {
        $0.image = ImageLiterals.Images.detailBookSample
    }
    private let goldStickerImage = UIImageView().then {
        $0.image = ImageLiterals.Icons.goldSticker
    }
    private let bookBackImage = UIImageView().then {
        $0.image = ImageLiterals.Icons.bookBack
    }
    private let bookNextImage = UIImageView().then {
        $0.image = ImageLiterals.Icons.bookNext
    }
    private let bookName = UILabel().then{
        $0.text = "기소영의 친구들"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    private let bookPrize = UILabel().then{
        $0.text = "제2회 사계절어린이문학상 대상 수상작"
        $0.font = .systemFont(ofSize: 14, weight: .medium)
    }
    private let bookWrite = UILabel().then{
        $0.text = "정은주(지은이) ㅣ 해랑(그림)"
        $0.textColor = UIColor.aladinGray4
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    private let bookRatingContainerView = UIView()
    private let bookRatingIcon = UIImageView().then {
        $0.image = ImageLiterals.Icons.star
    }
    private let bookRatingLabel = UILabel().then{
        $0.text = "4.6"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    private let bookHeartIcon = UIImageView().then {
        $0.image = ImageLiterals.Icons.heart
    }
    private let bookHeartLabel = UILabel().then{
        $0.text = "3,785"
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    
    //MARK: -
    
    // 책 가격 및 배송정보 뷰
    private let bookPriceContainerView = UIView()
    
    // 책 소개 뷰
    private let bookIntroContainerView = UIView()
    
    // 책 목차 뷰
    private let bookIndexContainerView = UIView()
    
    // 책 줄거리 뷰
    private let bookStoryContainerView = UIView()
    
    // 책 한 줄 리뷰 뷰
    private let bookReviewContainerView = UIView()
    
    // 알라딘 정보 뷰
    private let aladinInfoContainerView = UIView()
    
    // 하단 탭바 뷰
    private let toolBarContainerView = UIView()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
}

//MARK: - Extension

extension BookDetailVC {
    
    //MARK: - setLayout
    
    func setLayout() {
        
        // addSubViews
        view.addSubviews(naviView, contentScrollView, toolBarContainerView)
        naviView.addSubviews(backBtn, searchBtn, basketBtn)
        contentScrollView.addSubviews(
            bookInfoContainerView,
            bookPriceContainerView,
            bookIntroContainerView,
            bookIndexContainerView,
            bookStoryContainerView,
            bookReviewContainerView
        )
        bookInfoContainerView.addSubviews(
            bookImage,
            goldStickerImage,
            bookBackImage,
            bookNextImage,
            bookName,
            bookPrize,
            bookWrite,
            bookRatingContainerView
        )
        bookRatingContainerView.addSubviews(
            bookRatingIcon,
            bookRatingLabel,
            bookHeartIcon,
            bookHeartLabel
        )
        
        //MARK: - naviViewLayout
        
        // testColors
        bookInfoContainerView.backgroundColor = .white
        bookPriceContainerView.backgroundColor = .gray
        bookReviewContainerView.backgroundColor = .red
        toolBarContainerView.backgroundColor = .systemYellow
        
        // naviView 레이아웃
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
        
        //MARK: - bookInfoLayout
        
        bookInfoContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(423)
        }
        
        bookImage.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().offset(15)
            $0.height.equalTo(274)
            $0.width.equalTo(176)
        }
        
        goldStickerImage.snp.makeConstraints{
            $0.top.equalTo(bookImage.snp.top)   //근데 시뮬레이터에서 top이 동일하지 않음..
            $0.leading.equalTo(bookImage.snp.trailing).offset(9)
            $0.height.equalTo(46)
        }
        
        bookBackImage.snp.makeConstraints{
            $0.centerY.equalTo(bookImage)
            $0.trailing.equalTo(bookImage.snp.leading).offset(-4)
            $0.width.height.equalTo(32)
        }
        
        bookNextImage.snp.makeConstraints{
            $0.centerY.equalTo(bookImage)
            $0.leading.equalTo(bookImage.snp.trailing).offset(4)
            $0.width.height.equalTo(32)
        }
        
        bookName.snp.makeConstraints{
            $0.top.equalTo(bookImage.snp.bottom).offset(14)
            $0.centerX.equalToSuperview()
        }
        
        bookPrize.snp.makeConstraints{
            $0.top.equalTo(bookName.snp.bottom).offset(4)
            $0.centerX.equalTo(bookName)
        }

        bookWrite.snp.makeConstraints{
            $0.top.equalTo(bookPrize.snp.bottom).offset(4)
            $0.centerX.equalTo(bookPrize)
        }
        bookRatingContainerView.snp.makeConstraints{
            $0.top.equalTo(bookWrite.snp.bottom).offset(21)
            $0.centerX.equalTo(bookWrite)
            $0.width.equalTo(104)
            $0.height.equalTo(16)
        }
        bookRatingIcon.snp.makeConstraints{
            $0.top.leading.equalToSuperview()
            $0.height.width.equalTo(16)
        }
        bookRatingLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(bookRatingIcon.snp.trailing).offset(4)
        }
        bookHeartIcon.snp.makeConstraints{
            $0.leading.equalTo(bookRatingLabel.snp.trailing).offset(12)
            $0.height.width.equalTo(16)
        }
        bookHeartLabel.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        //MARK: - toolBarLayout
        
        toolBarContainerView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(64)
        }
        
        contentScrollView.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(toolBarContainerView.snp.top)
        }
        
        
        //bookImage  //goldStickerImage  //bookBackImage  //bookNextImage  //bookName  //bookPrize//bookWrite
        
        bookPriceContainerView.snp.makeConstraints{
            $0.top.equalTo(bookInfoContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(219)
        }
        
        bookIntroContainerView.snp.makeConstraints {
            $0.top.equalTo(bookPriceContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(182)
        }
        
        bookIndexContainerView.snp.makeConstraints {
            $0.top.equalTo(bookIntroContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(188)
        }
        
        bookStoryContainerView.snp.makeConstraints {
            $0.top.equalTo(bookIndexContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(227)
        }
        
        bookReviewContainerView.snp.makeConstraints {
            $0.top.equalTo(bookStoryContainerView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(593)
            $0.bottom.equalToSuperview()
        }
    }
}
