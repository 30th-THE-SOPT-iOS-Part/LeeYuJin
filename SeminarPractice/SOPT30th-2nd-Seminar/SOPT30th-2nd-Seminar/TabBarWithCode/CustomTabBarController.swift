//
//  CustomTabBarController.swift
//  SOPT30th-2nd-Seminar
//
//  Created by 이유진 on 2022/04/09.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
    
    func setTabBarController() {
        guard let firstViewController = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController"),
              let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController")
        else{ return }
        
        firstViewController.tabBarItem = UITabBarItem(title: "FirstTab", image: UIImage(systemName: "house"),selectedImage: UIImage(systemName: "house.fill"))
        
        secondViewController.tabBarItem = UITabBarItem(title: "SecondTab", image: UIImage(named: "Home"), selectedImage: UIImage(named: "Home-1"))
        
        setViewControllers([firstViewController,secondViewController], animated: true)
    }
    

}
