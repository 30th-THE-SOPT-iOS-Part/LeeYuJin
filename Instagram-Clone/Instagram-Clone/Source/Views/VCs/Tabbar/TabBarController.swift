//
//  TabBarController.swift
//  Instagram-Clone
//
//  Created by 이유진 on 2022/04/22.
//

import SnapKit
import Then
import UIKit

class TabBarController: UITabBarController {
    
    static let identifier: String = "TabBarController"
    public var tabs: [UIViewController] = []
    private var comeBackIndex = 0
    private var isNotch = UIScreen.hasNotch
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        selectedViewController = tabs[comeBackIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTabbar()
        setLayout()
    }
    
    private func configTabbar(){
        let customTabbar = tabBar
        customTabbar.tintColor = .black
        customTabbar.unselectedItemTintColor = .black
        customTabbar.backgroundColor = UIColor.white
        customTabbar.isTranslucent = false
        
        
        let homeStoryboard = UIStoryboard(name: "Home", bundle: nil)
        let homeVC = homeStoryboard.instantiateViewController(identifier: "HomeViewController")
        let homeTab = UINavigationController(rootViewController: homeVC)
        homeTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_home"), selectedImage: UIImage(named: "icn_home_selected"))
        
        let searchStoryboard = UIStoryboard(name: "Search", bundle: nil)
        let searchVC = searchStoryboard.instantiateViewController(identifier: "SearchViewController")
        let searchTab = UINavigationController(rootViewController: searchVC)
        searchTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_search"), selectedImage: UIImage(named: "icn_search_selected"))
        
        let reelsStoryboard = UIStoryboard(name: "Reels", bundle: nil)
        let reelsVC = reelsStoryboard.instantiateViewController(identifier: "ReelsViewController")
        let reelsTab = UINavigationController(rootViewController: reelsVC)
        reelsTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_reels"), selectedImage: UIImage(named: "icn_reels_selected"))
        
        let shopStoryboard = UIStoryboard(name: "Shop", bundle: nil)
        let shopVC = shopStoryboard.instantiateViewController(identifier: "ShopViewController")
        let shopTab = UINavigationController(rootViewController: shopVC)
        shopTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_shop"), selectedImage: UIImage(named: "icn_shop_selected"))
        
        let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let profileVC = profileStoryboard.instantiateViewController(identifier: "ProfileViewController")
        let profileTab = UINavigationController(rootViewController: profileVC)
        profileTab.tabBarItem = UITabBarItem(title: "", image: UIImage(named: "icn_profile"), selectedImage: UIImage(named: "icn_profile_selected"))
        
        
        if isNotch {
            homeTab.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0)
            searchTab.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0)
            reelsTab.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0)
            shopTab.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0)
            profileTab.tabBarItem.imageInsets = UIEdgeInsets(top: -5, left: 0, bottom: 0, right: 0)
        }
        else {
            homeTab.tabBarItem.imageInsets = UIEdgeInsets(top: -25, left: 0, bottom: 0, right: 0)
            searchTab.tabBarItem.imageInsets = UIEdgeInsets(top: -25, left: 0, bottom: 0, right: 0)
            reelsTab.tabBarItem.imageInsets = UIEdgeInsets(top: -25, left: 0, bottom: 0, right: 0)
            shopTab.tabBarItem.imageInsets = UIEdgeInsets(top: -25, left: 0, bottom: 0, right: 0)
            profileTab.tabBarItem.imageInsets = UIEdgeInsets(top: -25, left: 0, bottom: 0, right: 0)
            
        }
        
        tabs = [homeTab, searchTab, reelsTab, shopTab, profileTab]
        tabBar.itemPositioning = .centered
        tabBar.itemSpacing = 140
        
        setViewControllers(tabs, animated: true)
        selectedViewController = homeTab
    }
    
    
    
    override func viewDidLayoutSubviews() {
        let customTabbar = tabBar
        let tabbarY = view.getDeviceHeight()
        let tabbarX = view.getDeviceWidth()
        var tabbarHeight = 88
        if isNotch == false {tabbarHeight = 78}
        
        let frame = CGRect(x: 0,
                           y: tabbarY - tabbarHeight,
                           width: tabbarX,
                           height: tabbarHeight)
        customTabbar.frame = frame
    }
    
    //MARK: Layout
    func setLayout() {
        var tabBarHeight = 88 // 밖으로 꺼내기
        if isNotch{
            tabBarHeight = 88
        }else{
            tabBarHeight = 78
        }
    }
    
}

extension TabBarController {
//    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
//
//        print("clicked")
//        switch item.image {
//        case UIImage(named: "icn_reels"):
//            tabBar.barStyle = .black
//        default:
//            tabBar.barStyle = .default
//
//        }
//    }
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("selected")
        switch item{
        case tabBar.items?[2]:
            tabBar.backgroundColor = .black
            tabBar.tintColor = .white
            tabBar.unselectedItemTintColor = .white
            
           
        default:
            tabBar.backgroundColor = .white
            tabBar.tintColor = .black
            tabBar.unselectedItemTintColor = .black
        }
       
    }
}

