//
//  BaseTabBarController.swift
//  Challenge
//
//  Created by 石川大輔 on 2021/07/13.
//

import UIKit

class BaseTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9410743117, green: 0.9412353635, blue: 0.9410640597, alpha: 1)
        
        let teamController = createNavigationController(viewController: UIViewController(), imageName: "apps", title: "チーム")
        
        let searchController = createNavigationController(viewController: BaseSearchController(), imageName: "search", title: "チーム検索")
        
        let myDataController = createNavigationController(viewController: UIViewController(), imageName: "apps", title: "マイデータ")
        
        viewControllers = [teamController ,searchController, myDataController]
        
    }
    
//    Change statusBar backgroudColor
    override func viewDidAppear(_ animated: Bool) {
        if #available(iOS 13, *)
        {
            let statusBar = UIView(frame: (UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.windowScene?.statusBarManager?.statusBarFrame)!)
            statusBar.backgroundColor = #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)
            UIApplication.shared.windows.filter {$0.isKeyWindow}.first?.addSubview(statusBar)
        }
    }
    
    
    func createNavigationController(viewController: UIViewController, imageName: String, title: String = "") -> UINavigationController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.barTintColor = #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)
        navController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navController.tabBarItem.image = UIImage(named: imageName)
        UITabBar.appearance().tintColor = #colorLiteral(red: 0.9353960156, green: 0.2671836317, blue: 0.2663446367, alpha: 1)
        navController.tabBarItem.title = title
        viewController.navigationItem.title = title
        return navController
    }
    
}
