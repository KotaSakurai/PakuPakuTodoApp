//
//  MyData.swift
//  PakuPakuTodo
//
//  Created by 桜井広大 on 2018/07/03.
//  Copyright © 2018年 KotaSakurai. All rights reserved.
//

import Foundation

class MyData: NSObject, NSCoding {
    var valueString: String?
    
    override init() {
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        valueString = aDecoder.decodeObject(forKey: "valueString") as? String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(valueString, forKey: "valueString")
    }
}
