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
    
    // MARK: - UI Components

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
    
    private let profileStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 58
    }
    
    private let mileStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
    }
    
    private let mileLabel = UILabel().then {
        $0.text = "마일리지"
        $0.font = UIFont.font(.pretendardRegular, ofSize: 14)
        $0.textColor = .aladinGray6
    }
    
    private let mileNumLabel = UILabel().then {
        $0.text = "1,000"
        $0.font = UIFont.font(.pretendardMedium, ofSize: 18)
        $0.textColor = .aladinBlue
    }
    
    private let moneyStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
    }
    
    private let moneyLabel = UILabel().then {
        $0.text = "적립금"
        $0.font = UIFont.font(.pretendardRegular, ofSize: 14)
        $0.textColor = .aladinGray6
    }
    
    private let moneyNumLabel = UILabel().then {
        $0.text = "3,500"
        $0.font = UIFont.font(.pretendardMedium, ofSize: 18)
        $0.textColor = .aladinBlue
    }
    
    private let couponStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 10
    }
    
    private let couponLabel = UILabel().then {
        $0.text = "할인쿠폰"
        $0.font = UIFont.font(.pretendardRegular, ofSize: 14)
        $0.textColor = .aladinGray6
    }
    
    private let couponNumLabel = UILabel().then {
        $0.text = "2"
        $0.font = UIFont.font(.pretendardMedium, ofSize: 18)
        $0.textColor = .aladinBlue
    }
    
    //내역들 테이블뷰
    private lazy var listTableView: UITableView = {
        let tv = UITableView()
        tv.backgroundColor = .clear
        tv.separatorColor = .clear
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
       
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        register()
        setLayout()
        }
}

    // MARK: - Extensions

//램프의지니요정만 진하게 쓰고싶어 찾아본 코드인데 어떻게 쓰는걸까??

//extension UILabel {
//    func asFont(targetString: String, font: UIFont) {
//        let fullText = text ?? ""
//        let attributedString = NSMutableAttributedString(string: fullText)
//        let range = (fullText as NSString).range(of: "램프의 지니요정")
//        attributedString.addAttribute(.font, value: font, range: range)
//        attributedText = attributedString
//    }
//}
    
extension MyPageVC {
        
    private func register() {
        listTableView.register(ListTVC.self, forCellReuseIdentifier: ListTVC.identifier)
    }
    
    private func setLayout() {
        
        view.addSubview(scrollView)
        myInfoContainerView.backgroundColor = .aladinBlue2
        footerContainerView.backgroundColor = .red
        
        scrollView.addSubviews(myInfoContainerView,tradeListContainerView,footerContainerView)
        
        myInfoContainerView.addSubviews(infoView,silverSticker,profileStackView,profileImage,levelLabel,levelNumberLabel,helloLabel)
        
        profileStackView.addSubviews(mileStackView,moneyStackView,couponStackView)
        
        mileStackView.addSubviews(mileLabel,mileNumLabel)
        moneyStackView.addSubviews(moneyLabel,moneyNumLabel)
        couponStackView.addSubviews(couponLabel,couponNumLabel)
        
        tradeListContainerView.addSubviews(listTableView)

        
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
        
        profileStackView.snp.makeConstraints {
            $0.top.equalTo(helloLabel.snp.bottom).offset(36)
            $0.leading.trailing.equalToSuperview().inset(58)
            $0.bottom.equalToSuperview().inset(60)
        }
        
        mileStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(26)
        }
        
        mileLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        mileNumLabel.snp.makeConstraints {
            $0.top.equalTo(mileLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        moneyStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        moneyLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        moneyNumLabel.snp.makeConstraints {
            $0.top.equalTo(moneyLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        couponStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(26)
        }
        
        couponLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        
        couponNumLabel.snp.makeConstraints {
            $0.top.equalTo(couponLabel.snp.bottom).offset(10)
            $0.centerX.equalToSuperview()
        }

        tradeListContainerView.snp.makeConstraints { make in
            make.top.equalTo(myInfoContainerView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(560)
        }
        
        footerContainerView.snp.makeConstraints { make in
            make.top.equalTo(tradeListContainerView.snp.bottom)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(283)
            make.bottom.equalToSuperview()
        }
        
        listTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension MyPageVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let list = tableView.dequeueReusableCell(withIdentifier: ListTVC.identifier, for: indexPath)
                as? ListTVC else { return UITableViewCell() }
        list.selectionStyle = .none
        
        list.dataBind(model: dummyList[indexPath.row])
        return list
    }
}

extension MyPageVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
}
