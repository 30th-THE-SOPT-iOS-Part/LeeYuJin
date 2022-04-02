//
//  ViewController.swift
//  SOPT-30th-1st-Seminar
//
//  Created by 이유진 on 2022/04/02.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    
    @IBAction func moneyButtonDidTap(_ sender: Any) {
        messageLabel.text = "새로운 메세지가 도착했어요"
        messageLabel.textColor = UIColor.green
        messageLabel.sizeToFit()
        AudioServicesPlayAlertSound(SystemSoundID(1307))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        messageLabel.text = "도착한 메세지가 없어요!"
        
        
    }


}

