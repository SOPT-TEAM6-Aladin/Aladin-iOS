//
//  BasketVC.swift
//  Aladin-iOS
//
//  Created by devxsby on 2022/11/15.
//

import UIKit

final class BasketVC: UITabBarController {
    
    // MARK: - UI Components
    
    // 네비 뷰
    private let naviView = UIView()
    private let backBtn = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        $0.tintColor = .black
    }
    private let basketLabel = UILabel().then {
        $0.text = "장바구니"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    // TableView
    private lazy var basketTableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.dataSource = self
        $0.delegate = self
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        register()
    }
}

extension BasketVC {
    
    //MARK: - register
    private func register() {
        basketTableView.register(BasketTableViewCell.self, forCellReuseIdentifier: BasketTableViewCell.identifier)
    }
    
    //MARK: - setLayout
    
    func setLayout() {
        
        //MARK: - addSubViews
        
        view.addSubviews(naviView, basketTableView)
        naviView.addSubviews(backBtn, basketLabel)
        
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
            $0.height.equalTo(400)
        }
    }
}

extension BasketVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 132
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
}
