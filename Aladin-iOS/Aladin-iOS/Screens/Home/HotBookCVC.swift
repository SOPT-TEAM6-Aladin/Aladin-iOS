//
//  HotBookCVC.swift
//  Aladin-iOS
//
//  Created by JH on 2022/11/23.
//

import UIKit
import SnapKit
import Then

class HotBookCVC: UICollectionViewCell {
    
    static let identifier = "HotBookCVC"
        
    private let bookSampleImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 5
    }
    private let bookNameLabel = UILabel().then {
        $0.lineBreakMode = .byCharWrapping
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .aladinGray6
        $0.numberOfLines = 0
    }
    private let bookIntroLabel = UILabel().then {
        $0.lineBreakMode = .byCharWrapping
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .aladinGray6
        $0.numberOfLines = 0
    }
       
    
    
    // MARK: - Life Cycles

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.backgroundColor = .clear
        setLayout()
    }
        
    func dataBind(model : BookListDataArray) {
        
        DispatchQueue.global().async { [weak self] in
            let url = URL(string: model.cover)
            if let data = try? Data(contentsOf: url!) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.bookSampleImageView.image = image
                    }
                }
            }
        }
//        let url = URL(string: model.cover)
//        do {
//            let data = try Data(contentsOf: url!)
//            bookSampleImageView.image = UIImage(data: data)
//        } catch (let error) {
//            print("err")
//        }
        bookNameLabel.text = model.name
        bookIntroLabel.text = model.pickDescription
    }
        
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
    private func setLayout() {
        contentView.addSubviews(bookSampleImageView,bookNameLabel,bookIntroLabel)
        
        bookSampleImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.height.equalTo(180)
            make.leading.equalToSuperview()
        }
        
        bookNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview().offset(10)
        }
        
        bookIntroLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(240)
            make.leading.trailing.equalToSuperview().offset(10)
        }
    }
}

