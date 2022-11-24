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
    
    private let profileImage = UIImageView().then {
        $0.image = ImageLiterals.Icons.profileColor
    }
    
    private let levelLabel = UILabel().then {
        $0.text = "LV."
        $0.font = UIFont.font(.pretendardBold, ofSize: 20)
        $0.textColor = .aladinGray6
    }
    
    private let levelNumberLabel = UILabel().then {
        $0.text = "3"
        $0.font = UIFont.font(.pretendardBold, ofSize: 28)
        $0.textColor = .aladinBlue
    }
    
    private let helloLabel = UILabel().then {
        $0.text = "램프의 지니요정님, 안녕하세요!"
        $0.font = UIFont.font(.pretendardMedium, ofSize: 14)
    }
    
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        myInfoContainerView.backgroundColor = .aladinBlue2
        footerContainerView.backgroundColor = .red
        
        scrollView.addSubviews(myInfoContainerView,tradeListContainerView,footerContainerView)
        
        myInfoContainerView.addSubviews(infoView,silverSticker,profileImage,levelLabel,levelNumberLabel,helloLabel)
        
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
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(28)
        }
        
        silverSticker.snp.makeConstraints {
            $0.top.equalTo(infoView)
            $0.trailing.equalTo(infoView).inset(24)
        }
        
        profileImage.snp.makeConstraints {
            $0.width.height.equalTo(60)
            $0.top.equalToSuperview().offset(78)
            $0.leading.equalToSuperview().offset(36)
        }
        
        levelLabel.snp.makeConstraints {
            $0.leading.equalTo(profileImage.snp.trailing).offset(5)
            $0.top.equalToSuperview().offset(89)
        }
        
        levelNumberLabel.snp.makeConstraints {
            $0.leading.equalTo(levelLabel.snp.trailing).offset(2)
            $0.bottom.equalTo(levelLabel).offset(2)
        }
        
        helloLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(113)
            $0.leading.equalTo(levelLabel)
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


extension UILabel {
    func asFont(targetString: String, font: UIFont) {
        let fullText = text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "램프의 지니요정")
        attributedString.addAttribute(.font, value: font, range: range)
        attributedText = attributedString
    }
}
