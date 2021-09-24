//
//  ViewController.swift
//  PagingController
//
//  Created by 양수빈 on 2021/07/01.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addCollectionView()
        addPageControl()
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    var collectionView : UICollectionView!
    let cellId = "Cell"
    let imageNames = ["2D 입체", "2D 입체2", "2D 입체3", "2D 입체4"]
    let pageControl = UIPageControl()
    
    func addCollectionView() {
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = UIColor.backBlack
        // background color #1C1C1C
        
        self.view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        collectionView.snp.makeConstraints { (make) in
            make.bottom.leading.trailing.top.equalToSuperview()
        }
    }
    
    func addPageControl() {
        self.view.addSubview(pageControl)
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.snp.makeConstraints { (make) in
            make.leading.equalToSuperview()
            make.top.equalTo(84)
            make.height.equalTo(50)
        }
        pageControl.backgroundColor = UIColor.clear
        pageControl.numberOfPages = imageNames.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.gray
        pageControl.currentPageIndicatorTintColor = UIColor.mainPink
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath as IndexPath) as! CustomCollectionViewCell
        cell.imageView.image = UIImage(named: imageNames[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}
