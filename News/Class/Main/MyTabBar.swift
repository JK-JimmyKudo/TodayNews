//
//  MyTabBar.swift
//  News
//
//  Created by power on 2019/6/18.
//  Copyright © 2019 Henan XinKangqiao. All rights reserved.
//

import UIKit

class MyTabBar: UITabBar {


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(pushButton)
    }
    
   
    private lazy var pushButton:UIButton = {
        let pushButton = UIButton(type: .custom)
        pushButton.setImage(UIImage(named: "feed_publish_44x44_"), for: .normal)
        pushButton.setImage(UIImage(named: "feed_publish_press_44x44_"), for: .selected)
        pushButton.sizeToFit()
        return pushButton;
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        //首先定义tabbar的高度和宽度
        let width = frame.width
        let height:CGFloat = 64
        pushButton.center = CGPoint(x: width * 0.5, y: height * 0.5 - 7)
        //设置其他按钮的w宽度和高度
        let btnWidth :CGFloat = width * 0.2
        let btnHeight :CGFloat = height;
        let btnY:CGFloat = 0
        
        var index = 0
        
        for button in subviews {
     
            if !button.isKind(of: NSClassFromString("UITabBarButton")!){continue}
            let buttonX = btnWidth * ((index > 1 ? CGFloat(index + 1):CGFloat(index)))
            button.frame = CGRect(x: buttonX, y: btnY, width: btnWidth, height: btnHeight)
            index += 1
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

