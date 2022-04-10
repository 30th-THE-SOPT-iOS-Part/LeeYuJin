//
//  UIView++.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/04/10.
//

import UIKit

extension UIView {
    func addSubViews(_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
    
    func removeAllSubViews() {
        self.subviews.forEach { $0.removeFromSuperview() }
    }

    func getDeviceHeight() -> Int{
        return Int(UIScreen.main.bounds.height)
        }
    func getDeviceWidth() -> Int{
        return Int(UIScreen.main.bounds.width)
    }
    
    func dismissKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer =
            UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        self.endEditing(true)
    }
    
    func getShadowView(color : CGColor, masksToBounds : Bool, shadowOffset : CGSize, shadowRadius : Int, shadowOpacity : Float){
        layer.shadowColor = color
        layer.masksToBounds = masksToBounds
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = CGFloat(shadowRadius)
        layer.shadowOpacity = shadowOpacity
    }
    func removeShadowView(){
        layer.shadowOpacity = 0
    }
}
