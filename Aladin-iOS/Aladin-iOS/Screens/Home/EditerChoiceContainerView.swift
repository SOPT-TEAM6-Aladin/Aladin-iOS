//
//  editerChoiceContainerView.swift
//  Aladin-iOS
//
//  Created by JH on 2022/11/18.
//

import UIKit
import SnapKit

class EditerChoiceContainerView: UIView {
    
    private var editerChoiceCV: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 217, height: 204)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    private var imageData = [
                    UIImage(named: "book1"),
                    UIImage(named: "book2"),
                    UIImage(named: "book3")
    ]
    
    
    // MARK: - View Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        editerChoiceCV.backgroundColor = .clear
        setLayout()
        editerChoiceCV.register(BookCVC.self, forCellWithReuseIdentifier: "1")
        editerChoiceCV.delegate = self
        editerChoiceCV.dataSource = self
        editerChoiceCV.showsHorizontalScrollIndicator = false
    }
    
    private func setLayout(){
        addSubviews(editerChoiceCV)
        
        editerChoiceCV.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().offset(-46)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension EditerChoiceContainerView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = editerChoiceCV.dequeueReusableCell(withReuseIdentifier: "1", for: indexPath) as! BookCVC
        cell.dataBind(image: imageData[indexPath.row]!)
        return cell
    }
    
    
}
