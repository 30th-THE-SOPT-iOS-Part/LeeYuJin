//
//  UITextField.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/04/10.
//

import UIKit

extension UITextField {
  func addLeftPadding(width : CGFloat = 10) {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }

    func setLeftPadding(width: CGFloat){
        self.leftView?.snp.updateConstraints{ make in
            make.width.equalTo(width)
        }
    }
}

