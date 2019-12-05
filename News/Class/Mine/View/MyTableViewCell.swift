//
//  MyTableViewCell.swift
//  News
//
//  Created by power on 2019/11/28.
//  Copyright © 2019 Henan XinKangqiao. All rights reserved.
//

import UIKit
import SnapKit

class MyTableViewCell: UITableViewCell {

    
   open lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.red
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(tempLabel);
        
        tempLabel.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.height.equalTo(20)
            make.width.equalTo(100)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
