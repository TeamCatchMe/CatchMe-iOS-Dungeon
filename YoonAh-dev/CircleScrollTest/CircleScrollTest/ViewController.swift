//
//  ViewController.swift
//  CircleScrollTest
//
//  Created by SHIN YOON AH on 2021/06/29.
//

import UIKit

class ViewController: UIViewController {
    var tableView = UITableView()
    var headerView = CustomHeaderView(frame: CGRect.zero)
    var headerHeightConstraint: NSLayoutConstraint!
    var corner: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        setUpHeader()
        setUpTableView()
    }
    
    func setUpHeader() {
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        
        headerHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: 375)
        headerHeightConstraint.isActive = true
        
        let constraints:[NSLayoutConstraint] = [
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setUpTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        let constraints:[NSLayoutConstraint] = [
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController:UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 && self.headerHeightConstraint.constant < 375{
            self.headerHeightConstraint.constant += abs(scrollView.contentOffset.y)
            self.headerView.heightConstraint.constant += abs(scrollView.contentOffset.y)/2
            self.headerView.widthConstraint.constant += abs(scrollView.contentOffset.y)/2
            self.headerView.topConstraint.constant += abs(scrollView.contentOffset.y)/2
            
            self.headerView.backWidth.constant += abs(scrollView.contentOffset.y)*2.2
            self.headerView.backHeight.constant += abs(scrollView.contentOffset.y)*2.3
            self.headerView.backTop.constant -= abs(scrollView.contentOffset.y)
            
            if self.headerHeightConstraint.constant > 370 && self.headerView.colorView.layer.cornerRadius > 0 {
                self.headerView.colorView.layer.cornerRadius -= 10
            } else {
                self.headerView.colorView.layer.cornerRadius = self.headerView.backWidth.constant/2
            }
            
            if self.headerView.heightConstraint.constant > 116 {
                headerView.heightConstraint.constant = 116
            }
            
            if self.headerView.widthConstraint.constant > 135 {
                headerView.widthConstraint.constant = 135
            }
            
            if self.headerView.topConstraint.constant > 166 {
                headerView.topConstraint.constant = 166
            }
            
            if self.headerView.backWidth.constant > UIScreen.main.bounds.size.width {
                self.headerView.backWidth.constant = UIScreen.main.bounds.size.width
                self.headerView.colorView.layer.cornerRadius = 0
            }
            
            if self.headerView.backHeight.constant > UIScreen.main.bounds.size.width {
                self.headerView.backHeight.constant = UIScreen.main.bounds.size.width
            }
            
            if self.headerView.backTop.constant < 0 {
                self.headerView.backTop.constant = 0
            }
            
        } else if scrollView.contentOffset.y > 0 && self.headerHeightConstraint.constant >= 239 {
            self.headerHeightConstraint.constant -= scrollView.contentOffset.y/15
            
            self.headerView.heightConstraint.constant -= scrollView.contentOffset.y/33
            self.headerView.widthConstraint.constant -= scrollView.contentOffset.y/33
            self.headerView.topConstraint.constant -= scrollView.contentOffset.y/80
        
            if self.headerHeightConstraint.constant <= 239 {
                self.headerHeightConstraint.constant = 239
                
                self.headerView.heightConstraint.constant = 60
                self.headerView.widthConstraint.constant = 69
                self.headerView.topConstraint.constant = 137
                
                self.headerView.backHeight.constant = 105
                self.headerView.backWidth.constant = 105
                self.headerView.backTop.constant = 114
                self.headerView.colorView.layer.cornerRadius = 52.5
            } else if self.headerHeightConstraint.constant < 359 {
                self.headerView.backWidth.constant -= scrollView.contentOffset.y/6.3
                self.headerView.backHeight.constant = headerView.backWidth.constant
                self.headerView.backTop.constant += scrollView.contentOffset.y/15.5
                
                let offset = self.headerView.backWidth.constant/2
                if offset < 52.5 {
                    self.headerView.colorView.layer.cornerRadius = 52.5
                } else {
                    self.headerView.colorView.layer.cornerRadius = offset
                }
            } else {
                self.headerView.colorView.layer.cornerRadius += 7.2
            }
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if self.headerHeightConstraint.constant > 496 {
            animateHeader()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.headerHeightConstraint.constant > 496 {
            animateHeader()
        }
    }
    
    func animateHeader() {
        self.headerHeightConstraint.constant = 496
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: [], animations: {
            self.view.layoutIfNeeded()
            }, completion: nil)
    }
}

extension ViewController:UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath as IndexPath)
        cell.textLabel?.text = "Article \(indexPath.row)"
        return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
}


