//
//  ViewController.swift
//  CatchMe Practice
//
//  Created by Thisisme Hi on 2021/06/29.
//

import UIKit

import Then
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Property
    
    let naviBar = CustomNavigationBar()
    
    let mainHeader = HeaderView()
    
    let headerView = CharacterReportView()
    
    let mainTV = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAutoLayout()
        
        mainTV.backgroundColor = .mainBackground
        mainTV.separatorStyle = .none
        
        mainTV.register(TitleTVC.self, forCellReuseIdentifier: "TitleTVC")
        mainTV.register(ActivityTVC.self, forCellReuseIdentifier: "ActivityTVC")
        
        mainTV.delegate = self
        mainTV.dataSource = self
        
        mainTV.tableFooterView = UIView(frame: .zero)
        mainTV.sectionFooterHeight = 0
        
    }
    
    // MARK: - setupAutoLayout
    
    func setupAutoLayout() {
        
        view.addSubviews([mainTV, mainHeader, naviBar])
        
        naviBar.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(48)
        }
        
        mainHeader.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(UIScreen.main.bounds.width)
        }
        
        mainTV.snp.makeConstraints { (make) in
            make.top.equalTo(mainHeader.snp.bottom)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
    }
    
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            return CharacterReportView()
        default:
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 197
        default:
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 40
        default:
            return 40
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
        
        let width = UIScreen.main.bounds.width
        let backgroundWidth = self.mainHeader.backgroundView.bounds.width
        let backgroundHeight = self.mainHeader.backgroundView.bounds.height
        
        let offset = scrollView.contentOffset.y
        
        if width - offset < 200 {
            print(self.mainHeader.characterImageView.frame)
            UIView.animate(withDuration: 0.1) {
                self.mainHeader.characterImageView.transform = CGAffineTransform(scaleX: 67/135, y: 58/116).translatedBy(x: 0, y: -160)
                self.mainHeader.backgroundView.transform = CGAffineTransform(scaleX: 100/backgroundWidth, y: 100/backgroundHeight).translatedBy(x: 0, y: 185)
            
                // 헤더 부분 높이
                self.mainHeader.snp.updateConstraints { (make) in
                    make.height.equalTo(200)
                }
                
                // 핑크색 배경
                self.mainHeader.backgroundView.snp.updateConstraints { (make) in
                    make.width.equalTo(self.mainHeader.backgroundView.bounds.height)
                    make.height.equalTo(self.mainHeader.backgroundView.bounds.height)
                }
                
//                self.mainHeader.characterImageView.snp.updateConstraints { (make) in
//                    make.top.equalTo(89)
//                }

                // 핑크색 둥글기
                self.mainHeader.backgroundView.layer.cornerRadius = backgroundWidth / 2
                
            }
            
        } else {
            
            UIView.animate(withDuration: 0.2) {
                self.mainHeader.characterImageView.transform = .identity
                self.mainHeader.backgroundView.transform = .identity
                self.mainHeader.transform = .identity


                // 헤더 부분 높이
                self.mainHeader.snp.updateConstraints { (make) in
                    make.height.equalTo(width-offset)
                }
                
//                // 핑크색 배경
//                self.mainHeader.backgroundView.snp.updateConstraints { (make) in
//                    make.width.height.equalTo(width-offset)
//                }

                self.mainHeader.characterImageView.snp.updateConstraints { (make) in
                    make.top.equalTo(172)
                }
                
                // 핑크색 둥글기
                self.mainHeader.backgroundView.layer.cornerRadius = 0
                
            }
        }
        
    }
}



// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 30
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityTVC", for: indexPath)
                    as? ActivityTVC else { return UITableViewCell() }
            cell.backgroundColor = .orange
//            cell.selectionStyle = .none
            return cell
            
        default:
            
            return UITableViewCell()
        }
        
    }
    
    
}

