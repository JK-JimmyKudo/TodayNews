//
//  NetworkTool.swift
//  News
//
//  Created by power on 2019/11/25.
//  Copyright © 2019 Henan XinKangqiao. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkToolProtocol {
    //我的cell的数据
    static func loadMyCellData(completionHandler: @escaping (_ sections: [[MyCellModel]]) -> ())
    //我的关注的数据
    static func loadMyConcern()
}
 
extension NetworkToolProtocol{
    
    static func loadMyCelldata(completionHandler: @escaping (_ sections: [[MyCellModel]]) -> ()){
        
        let url = BASE_URL + "/user/tab/tabs/?"
        let params = ["device_id":device_id]
        
        
        Alamofire.request(url,parameters: params).responseJSON { (response) in
            
            //增加网络的提示消息  如果请求成功，走下一步，不成功，返回信息
            guard response.result.isSuccess else { return }
            
            if let value = response.result.value{
                let josn = JSON(value);
                guard josn["message"] == "success" else {return}
//                var mySections = [[MyCellModel]]()
                
                if let data = josn["data"].dictionary{
                    
                    if let sections = data["sections"]?.arrayObject  {
                        var sectionArray = [[MyCellModel]]()
                        for item in sections {
                            var rows = [MyCellModel]()
                            for row in (item as! Array<Any>)  {
                                let myCellModel = MyCellModel.deserialize(from: (row as! Dictionary))
                                print("myCellModel == ",myCellModel?.text ?? "");
                                rows.append(myCellModel!)
                            }
                            sectionArray.append(rows)
                        }
                        completionHandler(sectionArray)
                    }
                }
            }
        }
    }

    
    static func loadMyConcern(){
        
    
    }

}

struct NetworkTool:NetworkToolProtocol {
    static func loadMyCellData(completionHandler: @escaping ([[MyCellModel]]) -> ()) {
        print("NetworkTool:NetworkToolProtocol")
    }
}
