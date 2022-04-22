//
//  UIScreen.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/04/10.
//

import UIKit

public let widthRatio: CGFloat = UIScreen.main.bounds.width / 375
public let heightRatio: CGFloat = UIScreen.main.bounds.height / 812

extension UIScreen {
    
    class public var hasNotch: Bool {
        let deviceRatio
            = UIScreen.main.bounds.width / UIScreen.main.bounds.height
        if deviceRatio > 0.5 {
            return false
        }
        else{
            return true
        }
    }
}
