//
//  testResponse.swift
//  EY.Mtel_ProjectTemplate_Swift
//
//  Created by zxj on 2020/8/10.
//  Copyright © 2020 EY.Mtel. All rights reserved.
//

import UIKit
import HandyJSON

class topGrossingApplicationsModelArray :BaseModel{
    var author: authorArray?
    var entry: [entryArray]?
    var summary:Any?
    var link:Any?
    var category:Any?
}

class authorArray :BaseModel{
    var name: String?
    var uri: String?
}

class entryArray :BaseModel{
    
//    var im:image : String?
//    var im:name : String?
}
