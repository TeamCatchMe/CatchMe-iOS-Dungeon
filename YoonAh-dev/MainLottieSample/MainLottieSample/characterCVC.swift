//
//  characterCVC.swift
//  MainLottieSample
//
//  Created by SHIN YOON AH on 2021/07/01.
//

import UIKit

class characterCVC: UICollectionViewCell {
    static let identifier = "characterCVC"

    @IBOutlet weak var characterImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        characterImage.image = UIImage(named: "2D")
    }

}
