//
//  ViewController3.swift
//  CarouselEffectTest
//
//  Created by SHIN YOON AH on 2021/07/23.
//

import UIKit

class ViewController3: UIViewController {
    let cView = test()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(cView)
        cView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            cView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }

    @IBAction func touchupButton(_ sender: Any) {
        cView.removeFromSuperview()
    }
    
    
    @IBAction func touchupAdd(_ sender: Any) {
        view.addSubview(cView)
        
        NSLayoutConstraint.activate([
            cView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            cView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
    
    @IBAction func touchupError(_ sender: Any) {
        view.addSubview(cView)
        cView.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            cView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor, constant: 100),
            cView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 100)
        ])
    }
}
