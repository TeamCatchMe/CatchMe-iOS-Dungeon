//
//  PagingControlViewController.swift
//  PagingController
//
//  Created by 양수빈 on 2021/07/01.
//

import UIKit

class PagingControlViewController: UIViewController {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        for index in 0..<5 {
            let subView = UIView()
            subView.frame = UIScreen.main.bounds
            
            subView.backgroundColor = UIColor(red: CGFloat(index * 50)/255.0, green: CGFloat(index * 50)/255.0, blue: CGFloat(index * 50)/255.0, alpha: 1)
            subView.frame.origin.x = UIScreen.main.bounds.width * CGFloat(index)
            scrollView.addSubview(subView)
        }
//        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width*5, height: UIScreen.main.bounds.height)
        scrollView.alwaysBounceVertical = false
        pageControl.numberOfPages = 5
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PagingControlViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floor(scrollView.contentOffset.x / UIScreen.main.bounds.width))
    }
}
