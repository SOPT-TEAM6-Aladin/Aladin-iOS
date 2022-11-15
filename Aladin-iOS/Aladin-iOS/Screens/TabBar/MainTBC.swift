//
//  MainTBC.swift
//  Aladin-iOS
//
//  Created by devxsby on 2022/11/15.
//

import UIKit

final class MainTBC: UITabBarController {

    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setViewControllers()
        setTabBar()
    }

    // MARK: - Functions

    private func setViewControllers() {
        let myPageNVC = makeNavigationController(
            unselectedImage: UIImage(named: "ic_my"),
            selectedImage: UIImage(named: "ic_my_select"),
            rootViewController: MyPageVC(), title: "MY")

        let homeNVC = makeNavigationController(
            unselectedImage: UIImage(named: "ic_home"),
            selectedImage: UIImage(named: "ic_home_select"),
            rootViewController: HomeVC(), title: "홈")

        let basketNVC = makeNavigationController(
            unselectedImage: UIImage(named: "ic_cart"),
            selectedImage: UIImage(named: "ic_cart_select"),
            rootViewController: BasketVC(), title: "장바구니")

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

    private func makeNavigationController(unselectedImage: UIImage?, selectedImage: UIImage?, rootViewController: UIViewController, title: String) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.tabBarItem.title = title
        nav.isNavigationBarHidden = true
        
        return nav
    }
}
