//
//  myContentCell.swift
//  News
//
//  Created by power on 2019/12/19.
//  Copyright © 2019 Henan XinKangqiao. All rights reserved.
//

import UIKit

class MyContentCell: UITableViewCell {

    
    
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
    
    lazy var contentImg: UIImageView = {
        let accimage = UIImageView()
        accimage.image = UIImage(named: "")
        accimage.backgroundColor = UIColor.yellow
        accimage.layer.masksToBounds = true
        accimage.layer.cornerRadius = 40/2
        return accimage
    }()
    
    
    
    lazy var backView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue
        return view
    }()
    
    
    
    
//    lazy var collectionView: UICollectionView = {
//
//        let collectionView = UICollectionView()
//
//
//        return collectionView
//    }()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        self.selectionStyle = .none
        
        self.contentView.addSubview(backView)
        self.backView.addSubview(tempLabel);
        self.backView.addSubview(accImg)
        self.backView.addSubview(detailLabel)
        self.backView.addSubview(contentImg)

        backView.snp.makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.height.equalTo(50)
        }
        
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
//            make.left.equalTo(tempLabel.snp.right)
            make.width.equalTo(100)
            make.right.equalTo(accImg.snp.left).offset(-10)
            make.top.equalTo(0)
            make.bottom.equalTo(0)
        }

        
        contentImg.snp.makeConstraints { (make) in
        
            make.right.equalTo(detailLabel.snp.left).offset(-10)
            make.width.height.equalTo(40);
            make.centerY.equalTo(self.snp.centerY)
            
            
        }
        
        
        
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
