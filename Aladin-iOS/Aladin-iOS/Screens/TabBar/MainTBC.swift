//
//  MainTBC.swift
//  Aladin-iOS
//
//  Created by devxsby on 2022/11/15.
//

import UIKit

final class MainTBC: UITabBarController {
    
    // MARK: - Properties
    private let tabBarHeight: CGFloat = 96
    private let tabBarWidth: CGFloat = 300

    // MARK: - View Life Cycle

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setTabBarSize()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers()
        setTabBar()
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
    
    private func setViewControllers() {
        let myPageNVC = makeNavigationController(
            unselectedImage: UIImage(named: "ic_my"),
            selectedImage: UIImage(named: "ic_my"),
            rootViewController: MyPageVC())

        let homeNVC = makeNavigationController(
            unselectedImage: UIImage(named: "ic_home"),
            selectedImage: UIImage(named: "ic_home"),
            rootViewController: HomeVC())

        let basketNVC = makeNavigationController(
            unselectedImage: UIImage(named: "ic_basket"),
            selectedImage: UIImage(named: "ic_basket"),
            rootViewController: BasketVC())

        viewControllers = [myPageNVC, homeNVC, basketNVC]
    }

    private func setTabBar() {
        let appearance = UITabBar.appearance()
        
        appearance.backgroundImage = UIImage()
        appearance.shadowImage = UIImage()
        appearance.clipsToBounds = true
        
        tabBar.backgroundColor = .white
        tabBar.tintColor = .blue
        tabBar.unselectedItemTintColor = .black
    }

    private func makeNavigationController(unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.isNavigationBarHidden = true
        
        return nav
    }
}
