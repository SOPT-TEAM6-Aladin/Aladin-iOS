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
        layout.itemSize = CGSize(width: 120, height: 300)
        layout.minimumInteritemSpacing = 14
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    var topicViewArray: [BookListDataArray] = []

//    private var sampleImage = [
//                UIImage(named: "bookSample1"),
//                UIImage(named: "bookSample2"),
//                UIImage(named: "bookSample3")
//    ]
    
    // MARK: - Variables
    
//    var hotBookModel : [HotBookModel] = [
//        HotBookModel(sampleImage: "bookSample1", bookName: "브랜드로 남는다는 것", bookIntro: "끝까지 살아남는 브랜드는 무엇이 다른가"),
//        HotBookModel(sampleImage: "bookSample2", bookName: "피아노 치는 할머니가 될래", bookIntro: "인생 후반전에 만난 피아노를 향한 세레나데"),
//        HotBookModel(sampleImage: "bookSample3", bookName: "익스텐드 마인드", bookIntro: "창조성은 어떻게 뇌 바깥에서 탄생하는가"),
//        HotBookModel(sampleImage: "bookSample1", bookName: "스크롤테스트용", bookIntro: "스크롤 테스트용 어쩌고~ 브랜드는 무엇이 다른가")
//    ]

    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        hotBookCV.backgroundColor = .clear
        setLayout()
        hotBookCV.register(HotBookCVC.self, forCellWithReuseIdentifier: HotBookCVC.identifier)
        hotBookCV.delegate = self
        hotBookCV.dataSource = self
        hotBookCV.showsHorizontalScrollIndicator = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.hotBookCV.reloadData()
        }
    }
    
    private func setLayout(){
        addSubviews(hotBookCV)
        
        hotBookCV.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(48)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(46)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension HotBookContainerView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topicViewArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = hotBookCV.dequeueReusableCell(withReuseIdentifier: HotBookCVC.identifier, for: indexPath) as! HotBookCVC
            cell.dataBind(model: self.topicViewArray[indexPath.item])
        return cell
    }
}
