//
//  SecondVC.swift
//  Sopt-3rd-Seminar
//
//  Created by 이유진 on 2022/04/23.
//

import UIKit

protocol SecondVCDelegate {
    func sendData(data: String)
}

class SecondVC: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    
    var delegate: SecondVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func secondDataButtonDidTap(_ sender: Any) {
        if let text = dataTextField.text{
            delegate?.sendData(data: text)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}
