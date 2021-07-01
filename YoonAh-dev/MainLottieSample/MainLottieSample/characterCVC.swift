//
//  characterCVC.swift
//  MainLottieSample
//
//  Created by SHIN YOON AH on 2021/07/01.
//

import UIKit
import Lottie

class characterCVC: UICollectionViewCell {
    static let identifier = "characterCVC"
    
    // MARK: - Properties
    lazy var lottieView : AnimationView = {
        let animationView = AnimationView(name: "66948-confetti")
            animationView.frame = CGRect(x: 0, y: 0,
                                         width: UIScreen.main.bounds.size.width, height: self.bounds.size.height)
            animationView.center = self.center
            animationView.loopMode = .loop
            animationView.contentMode = .scaleAspectFill
            animationView.play()
        
            return animationView
    }()

    // MARK: - IBOutlet
    @IBOutlet weak var characterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        characterImage.image = UIImage(named: "2D")
        
        self.addSubview(lottieView)
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([
//            lottieView.topAnchor.constraint(equalTo: self.topAnchor),
//            lottieView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            lottieView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            lottieView.tra.constraint(equalTo: self.topAnchor)
//        ])
    }

}
