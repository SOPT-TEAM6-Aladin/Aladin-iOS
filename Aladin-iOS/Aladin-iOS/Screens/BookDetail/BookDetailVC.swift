//
//  BookDetailVC.swift
//  Aladin-iOS
//
//  Created by 김인영 on 2022/11/16.
//

import UIKit

class BookDetailVC: UIViewController {

    //MARK: - UI Components
    
    // 스크롤 뷰
    private let contentScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
