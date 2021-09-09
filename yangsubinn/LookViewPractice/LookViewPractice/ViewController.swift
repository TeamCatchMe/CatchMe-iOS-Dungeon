
//  ViewController.swift
//  LookViewPractice
//
//  Created by 양수빈 on 2021/09/02.
//

import UIKit

class ViewController: UIViewController {
    
    let categories = ["News", "Popular", "Popular"]
    let contentImages = [nil, ".purple", ".yellow", nil, nil]
    
//    var contentCVC = ContentCVC()
//    lazy var height = CGFloat()

    lazy var categoriesCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 4, left: 29, bottom: 4, right: 29)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width - 29*2) / 3 - 3, height: 29)
        layout.minimumInteritemSpacing = 1
        
        let collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(categoriesCVC.self, forCellWithReuseIdentifier: "categoriesCVC")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
    }()
    
    lazy var contentCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 100, right: 20)
        layout.minimumInteritemSpacing = 26
        
//        contentCVC.contentView.setNeedsLayout()
//        contentCVC.contentView.layoutIfNeeded()
//
//        var height = contentCVC.contentView.systemLayoutSizeFitting(CGSize(width: UIScreen.main.bounds.width - 40, height: UIView.layoutFittingCompressedSize.height)).height
//
//        print("height: \(height)")
//
//        contentCVC.prepareForReuse()
        
        let width = UIScreen.main.bounds.width - 40
        
        var estimateHeight: CGFloat = 400
        
        
        let dummyCell = ContentCVC(frame: CGRect(x: 0, y: 0, width: width, height: estimateHeight))
        dummyCell.layoutIfNeeded()
        let estimatedSize = dummyCell.systemLayoutSizeFitting(CGSize(width: width, height: estimateHeight))
        layout.itemSize = CGSize(width: width, height: estimatedSize.height)
        print("estimatedSize.height: \(estimatedSize.height)")

//        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40, height: estimateHeight)
        
       
        let colletionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        colletionView.register(ContentCVC.self, forCellWithReuseIdentifier: "ContentCVC")
        colletionView.backgroundColor = .clear
        colletionView.isScrollEnabled = true
        colletionView.showsVerticalScrollIndicator = true
        
        colletionView.dataSource = self
        colletionView.delegate = self
        
        return colletionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(categoriesCollectionView)
        view.addSubview(contentCollectionView)
        
        categoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        categoriesCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        categoriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        categoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        categoriesCollectionView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        contentCollectionView.snp.makeConstraints { make in
            make.top.equalTo(categoriesCollectionView.snp.bottom).offset(2)
            make.leading.trailing.equalToSuperview()
            make.height.equalToSuperview()
        }
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoriesCollectionView:
            return categories.count
            
        case contentCollectionView:
            return contentImages.count
        default:
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case categoriesCollectionView:
            guard let categoriesCell = collectionView.dequeueReusableCell(withReuseIdentifier: categoriesCVC.identifier, for: indexPath) as? categoriesCVC else { return UICollectionViewCell() }
            
            categoriesCell.textLabel.text = categories[indexPath.row]
            categoriesCell.layer.cornerRadius = 15
            categoriesCell.backgroundColor = .clear
            categoriesCell.textLabel.textColor = .lightGray
            
            if indexPath.row == 0 {
                collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .init())
                categoriesCell.isSelected = true
            }
            
            return categoriesCell
            
        case contentCollectionView:
            guard let contentCell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCVC.identifier, for: indexPath) as? ContentCVC else { return UICollectionViewCell() }
            
//            print("height: \(height)")
            
            contentCell.backgroundColor = .brown
            contentCell.layer.cornerRadius = 20
            
//            contentCell.contentView.setNeedsLayout()
//            contentCell.contentView.layoutIfNeeded()
//
//            contentCell.prepareForReuse()
            
//            print("contentImages[\(indexPath.item)]: \(contentImages[indexPath.item])")
            print("-----------------")
            
            if contentImages[indexPath.item] == nil {
                contentCell.hasContentImage = false
                contentCell.charNameLabel.text = "이미지X"
            } else {
                contentCell.hasContentImage = true
                contentCell.contentImage.backgroundColor = .white
                contentCell.charNameLabel.text = "이미지O"
            }
            
//            height = contentCell.contentView.systemLayoutSizeFitting(CGSize(width: UIScreen.main.bounds.width - 40, height: UIView.layoutFittingCompressedSize.height)).height
//
//            contentCell.systemLayoutSizeFitting(CGSize(width: UIScreen.main.bounds.width - 40, height: height))
            
            
            return contentCell
            
        default:
            return UICollectionViewCell()
        }
    }
    
//    func collectionview(_ collectionView: UICollectionView, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        if collectionView == contentCollectionView {
//////            guard let contentCell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentCVC.identifier, for: indexPath) as? ContentCVC else { return UICollectionViewCell() }
////
////            let width = UIScreen.main.bounds.width - 40
////            let estimateHeight: CGFloat = 390
////
////            return CGSize(width: width, height: estimateHeight)
////        } else { return CGSize() }
//    }
    
    /// didSelectItemAt이랑 didDeselectedItemAt으로 하려다가 맨 처음에 기본으로 News가 설정되어있는 상태를 하려니까 막혀서,, categoriesCVC에 isSelected를 override해서 했슴다
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        contentCVC.contentView.setNeedsLayout()
//        contentCVC.contentView.setNeedsLayout()
//        contentCVC.contentView.layoutIfNeeded()
//
//        var height = contentCVC.contentView.systemLayoutSizeFitting(CGSize(width: UIScreen.main.bounds.width - 40, height: UIView.layoutFittingCompressedSize.height)).height
//
//        contentCVC.prepareForReuse()
//
//        return CGSize(width: UIScreen.main.bounds.width - 40, height: height)
//    }
}

