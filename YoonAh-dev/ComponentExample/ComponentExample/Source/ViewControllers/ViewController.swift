//
//  ViewController.swift
//  ComponentExample
//
//  Created by SHIN YOON AH on 2021/06/29.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - custom components
    let button = CustomButton(title: "눌러주세요")
    let customView = CustomView()
    let basicBtn = BasicButton(title: "뷰를 위한 버튼")
    let basicBtn2 = BasicButton(title: "이거 누르면 뷰가 왔다갔다함")

    override func viewDidLoad() {
        super.viewDidLoad()
        setupAutoLayout()
        setupAction()
    }

    fileprivate func setupAutoLayout() {
        view.addSubviews([button,
                          customView,
                          basicBtn,
                          basicBtn2])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        customView.translatesAutoresizingMaskIntoConstraints = false
        basicBtn.translatesAutoresizingMaskIntoConstraints = false
        basicBtn2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            button.widthAnchor.constraint(equalToConstant: 100),
            customView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            customView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 100),
            customView.heightAnchor.constraint(equalToConstant: 200),
            customView.widthAnchor.constraint(equalToConstant: 200),
            basicBtn.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            basicBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            basicBtn2.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            basicBtn2.bottomAnchor.constraint(equalTo: basicBtn.topAnchor, constant: -50)
        ])
    }
    
    fileprivate func setupAction() {
        //// 누르면 버튼 색깔이 바뀌는 Action
        let action = UIAction { _ in
            self.button.changeColor(color: .random())
        }
        button.addAction(action, for: .touchUpInside)
        
        //// 누르면 customView 색깔변경되면서 움직이는 애니메이션
        let basicAction = UIAction { _ in
            self.customView.changeView()
        }
        basicBtn.addAction(basicAction, for: .touchUpInside)
        
        //// 누르면 spring animation + 색깔 변경 애니메이션
        let anotherAction = UIAction { _ in
            self.customView.springView()
        }
        basicBtn2.addAction(anotherAction, for: .touchUpInside)
    }
}

