//
//  WBMainViewController.swift
//  传智微博
//
//  Created by li sun on 22/07/18.
//  Copyright © 2018年 sunlight. All rights reserved.
//

import UIKit

class WBMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupChildControllers()
    }
    

}

extension WBMainViewController {
    
    private func setupChildControllers()  {
        
        let array = [["clsName":"WBHomeViewController","title":"首页","imageName":"home"],
                     ["clsName":"WBMessageViewController","title":"消息","imageName":"message_center"],
                     ["holdplace":"holdplace"],
                     ["clsName":"WBDiscoverViewController","title":"发现","imageName":"discover"],
                     ["clsName":"WBProfileViewController","title":"我","imageName":"profile"]
                     ]
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        
        
        viewControllers = arrayM
        
        
    }
    
    private func controller(dict:[String:String])->UIViewController {
        guard let clsName = dict["clsName"],
            let title = dict["title"],
            let imageName = dict["imageName"],
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? UIViewController.Type
            else { return UIViewController()}
        
            let vc = cls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage(named: "tabbar_" + imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_" + imageName + "_selected")?.withRenderingMode(.alwaysOriginal)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.orange], for: .highlighted)
        vc.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 12)], for: .init(rawValue: 0))
        let nav = WBNavigationController(rootViewController:vc)
        
        return nav
        
    }
    
    
    
}
