//
//  MineViewController.swift
//  News
//
//  Created by power on 2019/5/22.
//  Copyright © 2019 Henan XinKangqiao. All rights reserved.
//

import UIKit

class MineViewController: BaseViewController {
    
    var sections = [[MyCellModel]]()
    
   private lazy var tempTableView: UITableView = {
    let tempTableView = UITableView (frame: self.view.bounds, style:.plain)
    tempTableView.delegate = self
    tempTableView.dataSource = self
    tempTableView.backgroundColor = UIColor.green
    tempTableView.separatorStyle = .singleLine
    return tempTableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()


        self.view.addSubview(tempTableView)
        
      
//        self.tempTableView.register(MyTableViewCell.classForCoder(), forCellReuseIdentifier:"MyTableViewCell")

        ///1.tableView调用hw_registerCell方法
//        tempTableView.hw_registerCell(cell: MyTableViewCell.self)
        
        self.tempTableView.hw_registerCell(cell: MyTableViewCell.self)
        self.tempTableView.hw_registerCell(cell: MyContentCell.self)
        
        
        
//         UINib(nibName: "\(self)", bundle: nil) }

        print("nibName == ","\(self)");

        NetworkTool.loadMyCelldata { (sections) in
                        
            let string = "{\"text\":\"我的关注\",\"grey_text\":\"\"}"
            let myConcern = MyCellModel.deserialize(from: string)
            var myconcerns = [MyCellModel]()
            myconcerns.append(myConcern!)

            self.sections.append(myconcerns)
            self.sections += sections;
            self.tempTableView.reloadData()
            print(sections)
        }
    }
}


extension MineViewController:UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return self.sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.sections[section].count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return  section == 1 ? 0 : 10
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 10))
        view.backgroundColor = UIColor.red
        return view
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let model = self.sections[indexPath.section][indexPath.row]
        
        
        if model.text == "我的关注" {
            let cell = tableView.hw_dequeueReusableCell(indexPath: indexPath) as MyContentCell
            cell.tempLabel.text = model.text
            cell.detailLabel.text = model.grey_text
            return cell
        }
        
        let cell = tableView.hw_dequeueReusableCell(indexPath: indexPath) as MyTableViewCell
        
        cell.tempLabel.text = model.text
        cell.detailLabel.text = model.grey_text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return indexPath.section == 0 ? 100 : 50
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}


