//
//  TabBarViewController.swift
//  viewWillAppearDemo
//
//  Created by hooyking on 2023/11/9.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let normalItemIcons:[String] = ["homeNormal","hotNormal","mineNormal"]
        let lightItemIcons:[String] = ["homeLight","hotLight","mineLight"]
        let itemTitles:[String] = ["Home","Hot","Mine"]
        let subVCs:[UIViewController] = [HomeViewController(),HotViewController(),MineViewController()]
        
        var resultVCs:[UINavigationController] = []
        
        for i in 0...normalItemIcons.count-1 {
            let subVC = subVCs[i]
            subVC.title = itemTitles[i]
            let navVC = UINavigationController(rootViewController: subVC)
            navVC.tabBarItem.image = UIImage(named: normalItemIcons[i])
            navVC.tabBarItem.selectedImage = UIImage(named: lightItemIcons[i])
            navVC.tabBarItem.title = itemTitles[i]
            
            if #available(iOS 15.0, *) {
                let navAppear = UINavigationBarAppearance()
                navAppear.configureWithOpaqueBackground()
                navAppear.backgroundColor = UIColor.green
                navAppear.shadowColor = UIColor.clear
                navAppear.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18.0)]
                navVC.navigationBar.scrollEdgeAppearance = navAppear
                navVC.navigationBar.standardAppearance = navAppear
                
                let tabBarAppear = UITabBarAppearance()
                tabBarAppear.configureWithOpaqueBackground()
                tabBarAppear.backgroundColor = UIColor.brown//标签栏背景色
                let normalAttrs: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor:UIColor.gray,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13.0),NSAttributedString.Key.paragraphStyle:NSParagraphStyle.default]
                let selectedAttrs: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor:UIColor.red, NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13.0),NSAttributedString.Key.paragraphStyle:NSParagraphStyle.default]
                tabBarAppear.stackedLayoutAppearance.normal.titleTextAttributes = normalAttrs
                tabBarAppear.stackedLayoutAppearance.selected.titleTextAttributes = selectedAttrs
                //compactInlineLayoutAppearance，当iPhone为横屏时，需要设置此属性
                tabBarAppear.compactInlineLayoutAppearance.normal.titleTextAttributes = normalAttrs
                tabBarAppear.compactInlineLayoutAppearance.selected.titleTextAttributes = selectedAttrs
                //inlineLayoutAppearance，当为iPad时，需要设置此属性，因为iPad标签栏图标文字为左右排列
                tabBarAppear.inlineLayoutAppearance.normal.titleTextAttributes = normalAttrs
                tabBarAppear.inlineLayoutAppearance.selected.titleTextAttributes = selectedAttrs
                navVC.tabBarItem.scrollEdgeAppearance = tabBarAppear
                navVC.tabBarItem.standardAppearance = tabBarAppear
            } else {
                navVC.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 18.0)]
                navVC.navigationBar.barTintColor = UIColor.green
                navVC.navigationBar.shadowImage = UIImage()
                navVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.gray,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13.0)], for: .normal)
                navVC.tabBarItem.setTitleTextAttributes([NSAttributedString.Key.foregroundColor:UIColor.red,NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13.0)], for: .selected)
                tabBar.barTintColor = UIColor.brown
            }
            
            resultVCs.append(navVC)
        }
        
        self.viewControllers = resultVCs

        
    }

}

extension UIColor {
    func asImage(_ size:CGSize) -> UIImage? {
        var resultImage:UIImage? = nil
        let rect = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        guard let context = UIGraphicsGetCurrentContext() else {
            return resultImage
        }
        context.setFillColor(self.cgColor)
        context.fill(rect)
        resultImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resultImage
    }
}
