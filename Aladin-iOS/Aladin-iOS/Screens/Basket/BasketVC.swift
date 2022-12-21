//
//  BasketVC.swift
//  Aladin-iOS
//
//  Created by devxsby on 2022/11/15.
//

import UIKit
import SnapKit
import Then

final class BasketVC: UITabBarController {
   
    var isChecked : Bool = false {
        didSet {
            basketTableView.reloadData()
        }
    }
    
    // MARK: - Dummy
    
    var basketDummy : [BasketModel] = [
        BasketModel(image: UIImage(named: "book_image1"), name: "기소영의 친구들", price: 10800, quantity: "1", deliveryInfo: "11월 7일(월) 밤 11시 잠들기전 배송", ischecked: true),
        BasketModel(image: UIImage(named: "book_image2"), name: "피아노 치는 할머니가 될래", price: 14400, quantity: "1", deliveryInfo: "11월 7일(월) 밤 11시 잠들기전 배송", ischecked: true),
        BasketModel(image: UIImage(named: "book_image1"), name: "기소영의 친구들2", price: 20800, quantity: "1", deliveryInfo: "11월 8일(화) 아침 11시전 배송", ischecked: true),
        BasketModel(image: UIImage(named: "book_image2"), name: "피아노 치는 할아버지가 될래", price: 18400, quantity: "1", deliveryInfo: "11월 8일(화) 아침 11시전 배송", ischecked: false)
    ]
    
    
    // MARK: - UI Components
    
    // 네비 뷰
    private let naviView = UIView()
    private lazy var backBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        $0.tintColor = .black
        $0.addTarget(self, action: #selector(touchUpBackBtn), for: .touchUpInside)
    }
    private let basketLabel = UILabel().then {
        $0.text = "장바구니"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    // TableView
    private lazy var basketTableView: UITableView = UITableView(frame: CGRect.zero, style: .grouped).then {
        $0.allowsSelection = false
        $0.backgroundColor = .white
        $0.separatorStyle = .none
        $0.dataSource = self
        $0.delegate = self
    }
    
    // 하단 TabBar Container
    private let tabbarContainerView = UIView()
    private let totalPriceLabel = UILabel().then {
        $0.text = "총 결제 예정금액"
        $0.font = .systemFont(ofSize: 16, weight: .semibold)
    }
    private let totalPrice = UILabel().then {
        $0.text = "64,400원"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    private let accumulateLabel = UILabel().then {
        $0.text = "적립예정포인트"
        $0.textColor = .aladinGray4
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    private let accumlatePoint = UILabel().then {
        $0.text = "644P"
        $0.textColor = .aladinGray4
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    private let purchaseButton = UIButton().then {
        $0.setTitle("구매하기", for: .normal)
        $0.backgroundColor = .aladinBlue
        $0.layer.cornerRadius = 12
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        register()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideTabBar()
    }
    
    func hideTabBar() {
        self.tabBarController?.tabBar.layer.zPosition = -1
        self.tabBarController?.tabBar.isHidden = true
    }
    
    @objc private func touchUpBackBtn() {
        let tabbar = MainTBC()
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootVC(tabbar, animated: false)
    }
}

extension BasketVC {
    
    //MARK: - register
    private func register() {
        basketTableView.register(BasketTableViewCell.self, forCellReuseIdentifier: BasketTableViewCell.identifier)
        basketTableView.register(BasketHeaderView.self, forHeaderFooterViewReuseIdentifier: BasketHeaderView.identifier)
        basketTableView.register(BasketFooterView.self, forHeaderFooterViewReuseIdentifier: BasketFooterView.identifier)
    }
    
    //MARK: - setLayout
    
    func setLayout() {
        
        //MARK: - addSubViews
        
        view.addSubviews(
            naviView,
            basketTableView,
            tabbarContainerView
        )
        
        naviView.backgroundColor = .white
        basketTableView.backgroundColor = .white
        tabbarContainerView.backgroundColor = .white
        
        naviView.addSubviews(backBtn, basketLabel)
        
        tabbarContainerView.addSubviews(
            totalPriceLabel,
            totalPrice,
            accumulateLabel,
            accumlatePoint,
            purchaseButton
        )
        
        tabbarContainerView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(145)
        }
        totalPriceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(19)
            $0.leading.equalToSuperview().offset(20)
        }
        totalPrice.snp.makeConstraints {
            $0.centerY.equalTo(totalPriceLabel)
            $0.trailing.equalToSuperview().inset(20)
        }
        accumulateLabel.snp.makeConstraints {
            $0.top.equalTo(totalPriceLabel.snp.bottom).offset(16)
            $0.leading.equalToSuperview().offset(19)
        }
        accumlatePoint.snp.makeConstraints {
            $0.centerY.equalTo(accumulateLabel)
            $0.trailing.equalToSuperview().inset(19)
        }
        purchaseButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        //MARK: - naviViewLayout
        naviView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(48)
        }
        backBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.height.width.equalTo(24)
        }
        basketLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
        basketTableView.snp.makeConstraints {
            $0.top.equalTo(naviView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(tabbarContainerView.snp.top)
        }
        
        
    }
}

extension BasketVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == basketDummy.count - 1 ? 182 : 132
    }
}

extension BasketVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basketDummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let basketCell = tableView.dequeueReusableCell(withIdentifier: BasketTableViewCell.identifier, for: indexPath) as? BasketTableViewCell else { return UITableViewCell() }
        
        for i in 0...indexPath.row {
            basketDummy[i].ischecked = isChecked
        }

        basketCell.dataBind(model: basketDummy[indexPath.row])
        return basketCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: BasketHeaderView.identifier) as! BasketHeaderView
        view.delegate = self
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: BasketFooterView.identifier) as! BasketFooterView
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 92
    }
}

extension BasketVC : BasketHeaderDelegate {
    func buttonState(bool: Bool) {
        isChecked = bool
    }
}
