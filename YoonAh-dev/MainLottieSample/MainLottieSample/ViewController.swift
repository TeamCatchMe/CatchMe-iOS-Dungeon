//
//  ViewController.swift
//  MainLottieSample
//
//  Created by SHIN YOON AH on 2021/07/01.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Properties
    let pageControl = PageControl()
    
    // MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    
    var totals: [String] = ["24%", "25%", "32%", "11%", "8%"]
    var weeks : [String] = ["10", "12", "18", "5", "3"]
    var months: [String] = ["18", "14", "12", "6", "4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPageControl()
        setupCollectionView()
        setLabels()
    }
    
    private func setLabels() {
        changeLabelText(page: 0)
    }
    
    private func changeLabelText(page: Int) {
        totalLabel.text = totals[page]
        weekLabel.text = weeks[page]
        monthLabel.text = months[page]
    }
    
    private func setupPageControl() {
        pageControl.pages = 5
        
        view.addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            pageControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            pageControl.heightAnchor.constraint(equalToConstant: 12),
            pageControl.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: characterCVC.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: characterCVC.identifier)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: characterCVC.identifier, for: indexPath) as? characterCVC else {
            return UICollectionViewCell()
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension ViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        //// page control selected page 바꾸는 코드
        let page = round(scrollView.contentOffset.x / scrollView.frame.width)
        pageControl.selectedPage = Int(page)
        
        //// Label 내용 변경하는 코드
        changeLabelText(page: Int(page))
    }
}
