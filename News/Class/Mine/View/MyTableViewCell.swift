//
//  MyTableViewCell.swift
//  News
//
//  Created by power on 2019/11/28.
//  Copyright © 2019 Henan XinKangqiao. All rights reserved.
//

import UIKit
import SnapKit

class MyTableViewCell: UITableViewCell{

    
   open lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.red
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.orange
        return label
    }()
    
    lazy var accImg: UIImageView = {
        let accimage = UIImageView()
        accimage.image = UIImage(named: "setting_rightarrow_night_8x14_")
        return accimage
    }()
    
    
    
    
    
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        self.contentView.addSubview(tempLabel);
        self.contentView.addSubview(accImg)
        self.contentView.addSubview(detailLabel)
        
        tempLabel.snp.makeConstraints { (make) in
            make.left.equalTo(0)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
            make.width.equalTo(100)
        }
        
        accImg.snp.makeConstraints { (make) in
            make.width.equalTo(8)
            make.height.equalTo(14)
            make.right.equalTo(-10)
            make.centerY.equalTo(self.snp.centerY)
        }
        
        detailLabel.snp.makeConstraints { (make) in
            make.left.equalTo(tempLabel.snp.right)
            make.right.equalTo(accImg.snp.left).offset(-10)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
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
