//
//  TextFieldPracticeVC.swift
//  Sopt-3rd-Seminar
//
//  Created by 이유진 on 2022/04/23.
//

import UIKit

class TextFieldPracticeVC: UIViewController, SecondVCDelegate {
    func sendData(data: String) {
        dataLabel.text = data
    }
    

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var dataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        

        // Do any additional setup after loading the view.
    }

    @IBAction func nextButtonDidTap(_ sender: Any) {
        guard let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondVC else {
            return
        }
        
        secondVC.delegate = self
        
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

extension TextFieldPracticeVC: UITextFieldDelegate{
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("텍스트 편집이 시작되었습니다.")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return 버튼이 눌렸어요")
        textField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        print("텍스트 필드의 편집이 끝났습니다.")
    }
}
