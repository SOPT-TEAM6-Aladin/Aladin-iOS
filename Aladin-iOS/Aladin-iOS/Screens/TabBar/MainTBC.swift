//
//  MainTBC.swift
//  Aladin-iOS
//
//  Created by devxsby on 2022/11/15.
//

import UIKit

import SnapKit

final class MainTBC: UITabBarController {
    
    // MARK: - Properties
    
    private var freshLaunch = true
    private let tabBarHeight: CGFloat = 96
    private let tabBarWidth: CGFloat = 270
    
    // MARK: - UI
    
    private let containerView = UIView()
    private let horizontalLine = UIView()

    // MARK: - View Life Cycle

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setTabBarSize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers()
        setTabBar()
        setTabBackground()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDefaultTab()
    }

    // MARK: - Functions

    private func setTabBarSize() {
        let safeHeight = view.safeAreaInsets.bottom
        var tabFrame = self.tabBar.frame
        tabFrame.size.width = tabBarWidth
        tabFrame.size.height = tabBarHeight + safeHeight
        tabFrame.origin.x = (self.view.frame.size.width - tabBarWidth) / 2
        tabFrame.origin.y = self.view.frame.size.height - tabBarHeight
        self.tabBar.frame = tabFrame
    }
    
    private func setDefaultTab() {
        if freshLaunch == true {
            freshLaunch = false
            selectedIndex = 1
        }
    }
    
    private func setViewControllers() {
        let myPageNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTBC.myPageTabIcn,
            selectedImage: ImageLiterals.MainTBC.myPageTabIcn,
            rootViewController: MyPageVC())

        let homeNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTBC.homeTabIcn,
            selectedImage: ImageLiterals.MainTBC.homeTabIcn,
            rootViewController: HomeVC())

        let basketNVC = makeNavigationController(
            unselectedImage: ImageLiterals.MainTBC.basketTabIcn,
            selectedImage: ImageLiterals.MainTBC.basketTabIcn,
            rootViewController: BasketVC())

        viewControllers = [myPageNVC, homeNVC, basketNVC]
    }

    private func setTabBar() {
        let appearance = UITabBar.appearance()
        
        appearance.backgroundImage = UIImage()
        appearance.shadowImage = UIImage()
        appearance.clipsToBounds = true
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .aladinBlue
        tabBar.unselectedItemTintColor = .black
    }
    
    private func setTabBackground() {
        let safeHeight = view.safeAreaInsets.bottom
        containerView.backgroundColor = .white
        horizontalLine.backgroundColor = .aladinGray1
        
        view.addSubviews(horizontalLine, containerView)
        
        self.view.bringSubviewToFront(self.tabBar)
        self.view.bringSubviewToFront(self.horizontalLine)

        containerView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(safeHeight + tabBarHeight)
        }
        
        horizontalLine.snp.makeConstraints { make in
            make.top.equalTo(containerView).inset(1)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
    }

    private func makeNavigationController(unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.isNavigationBarHidden = true
        
        return nav
    }
}
