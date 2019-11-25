//
//  MainTabBarViewController.swift
//  News
//
//  Created by power on 2019/5/22.
//  Copyright © 2019 Henan XinKangqiao. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        let tabBar = UITabBar.appearance()
//        tabBar.tintColor = UIColor(red: 245 / 255, green: 90 / 255, blue: 93 / 255, alpha: 1/0)
        
        addChildController()
        
        // Do any additional setup after loading the view.
    }
    
    // private在当前文件中可以访问,其他文件不能访问
    
   private func addChildController() {
        setupAddChild(HomeViewController(), "首页", "home_tabbar_32x32_", "home_tabbar_press_32x32_")
        setupAddChild(VideoViewController(), "视频", "video_tabbar_32x32_", "video_tabbar_press_32x32_")
        setupAddChild(HuoShanViewController(), "火山", "huoshan_tabbar_32x32_", "huoshan_tabbar_press_32x32_")
        setupAddChild(MineViewController(), "我的", "mine_tabbar_32x32_", "mine_tabbar_press_32x32_")
    }
    
    private func setupAddChild(_ childController: UIViewController,_ title:NSString,_ nomalImage:NSString,_ selecImage:NSString) {
        
        //设置控制器的title
        childController.title = title as String;
        childController.tabBarItem.image = UIImage(named: nomalImage as String)
        childController.tabBarItem.selectedImage = UIImage(named: selecImage as String)

        //设置tabBar的图片和文字
        let barItem = UITabBarItem.init(title: title as String, image: UIImage.init(named: nomalImage as String)?.withRenderingMode(.alwaysOriginal), selectedImage: UIImage.init(named: selecImage as String)?.withRenderingMode(.alwaysOriginal))
        //2.更改字体颜色
        
        
//        // 修改标签栏选中时文字颜色、字体
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)], for: .selected)
//        // 修改标签栏未选中时文字颜色、字体
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)], for: .normal)
        // 设置字体偏移
//        UITabBarItem.appearance().titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: 0.0)
        
        let nav = MainNavigationController.init(rootViewController: childController)

        nav.tabBarItem = barItem;
        setValue(MyTabBar(), forKey: "tabBar")
        self.addChild(nav)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
