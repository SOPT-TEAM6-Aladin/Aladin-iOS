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
    
    // 책 상세정보 뷰
    private let bookInfoContainerView = UIView()
    private let bookImage = ImageLiterals.Images.detailBookSample
    private let goldStickerImage = ImageLiterals.Icons.goldSticker
    private let bookBackImage = ImageLiterals.Icons.bookBack
    private let bookNextImage = ImageLiterals.Icons.bookNext
    private let bookName: () = UILabel().text = "기소영의 친구들"
    private let bookPrize: () = UILabel().text = "제2회 사계절어린이문학상 대상 수상작"
    private let bookWrite: () = UILabel().text = "정은주(지은이) ㅣ 해랑(그림)"
    
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
        
        bookInfoContainerView.backgroundColor = .black
        bookPriceContainerView.backgroundColor = .gray
        bookReviewContainerView.backgroundColor = .red
        toolBarContainerView.backgroundColor = .systemYellow
        
        naviView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(48)
        }
        
        toolBarContainerView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(64)
        }
        
        contentScrollView.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(toolBarContainerView.snp.top)
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
        
        bookInfoContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(423)
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
