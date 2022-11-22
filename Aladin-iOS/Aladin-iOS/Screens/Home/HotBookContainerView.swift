//
//  HotBookContainerView.swift
//  Aladin-iOS
//
//  Created by JH on 2022/11/23.
//

import SnapKit
import UIKit

class HotBookContainerView: UIView {
    
    private var hotBookCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 130, height: 250)
        layout.minimumLineSpacing = 14
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()

    private var sampleImageData = [
                UIImage(named: "bookSample1"),
                UIImage(named: "bookSample2"),
                UIImage(named: "bookSample3")
    ]
  
    
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        hotBookCV.backgroundColor = .clear
        setLayout()
        hotBookCV.register(HotBookCVC.self, forCellWithReuseIdentifier: "2")
        hotBookCV.delegate = self
        hotBookCV.dataSource = self
        hotBookCV.showsHorizontalScrollIndicator = false
    }
    
    private func setLayout(){
        addSubviews(hotBookCV)
        
        hotBookCV.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(48)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(46)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension HotBookContainerView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = hotBookCV.dequeueReusableCell(withReuseIdentifier: "2", for: indexPath) as! HotBookCVC
        cell.dataBind(image: sampleImageData[indexPath.row]!)
       
        return cell
    }
    
}
