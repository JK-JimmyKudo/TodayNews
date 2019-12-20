//
//  UIKit+Ext.swift
//  News
//
//  Created by power on 2019/12/18.
//  Copyright © 2019 Henan XinKangqiao. All rights reserved.
//

import UIKit

protocol TableViewCellFromNib {}

extension TableViewCellFromNib {
    static var identifier: String { return "\(self)ID" }
    static var nib: UINib? {
        return UINib(nibName: "\(self)", bundle: nil) }
    
    static func hw_getNibPath() -> String? {
        
        return Bundle.main.path(forResource: "\(self)", ofType: "nib")
    }
}

extension UITableViewCell : TableViewCellFromNib{}

extension UITableView {
    /// 注册 cell 的方法 注意:identifier是传入的 T+ID
    func hw_registerCell<T: UITableViewCell>(cell: T.Type) {
        if T.hw_getNibPath() != nil {
            register(T.nib, forCellReuseIdentifier: T.identifier)
        } else {
            register(cell, forCellReuseIdentifier: T.identifier)
        }
    }
    /// 从缓存池池出队已经存在的 cell
    func hw_dequeueReusableCell<T: UITableViewCell>(indexPath: IndexPath) -> T {
        if T.identifier == UITableViewCell.identifier {
            print("获取cell 后方必须固定添加(as 你的cell名称)")
            register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
            return dequeueReusableCell(withIdentifier: UITableViewCell.identifier, for: indexPath) as! T
        }
        let cell = dequeueReusableCell(withIdentifier: T.identifier) as? T
        if cell == nil {
            hw_registerCell(cell: T.self)
        }
        return dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as! T
    }
}






