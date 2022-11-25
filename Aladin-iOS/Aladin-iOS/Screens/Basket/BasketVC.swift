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
    private lazy var basketTableView = UITableView().then {
        $0.allowsSelection = false
        $0.backgroundColor = .clear
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
        $0.text = "10,800원"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    private let accumulateLabel = UILabel().then {
        $0.text = "적립예정포인트"
        $0.textColor = .aladinGray4
        $0.font = .systemFont(ofSize: 12, weight: .medium)
    }
    private let accumlatePoint = UILabel().then {
        $0.text = "600P"
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
        
        basketCell.dataBind(model: basketDummy[indexPath.row])
        return basketCell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: BasketHeaderView.identifier) as! BasketHeaderView
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
