//
//  SecondViewController.swift
//  SOPT-30th-1st-Seminar
//
//  Created by 이유진 on 2022/04/02.
//

import UIKit

class SecondViewController: UIViewController {
    var message: String?
    
    @IBOutlet var dataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setMessage()
       }
    

    @IBAction func backButtonDidTap(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setMessage() {
        if let message = message{
            dataLabel.text = message
            dataLabel.sizeToFit()
        }
    }

}
