//
//  PopUpViewController.swift
//  CustomCalendar
//
//  Created by SHIN YOON AH on 2021/07/01.
//

import UIKit

class PopUpViewController: UIViewController {
    @IBOutlet weak var dateLabel: UILabel!
    
    var date: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dateLabel.text = date
    }
    
    func setLabel(date: String) {
        self.date = date
    }

    @IBAction func clickToClose(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
