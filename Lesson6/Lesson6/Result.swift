//
//  Result.swift
//  Lesson6
//
//  Created by Do Hung on 7/16/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit
import ObjectMapper
class Result: Mappable {
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        url <- map["url"]
        des <- map["description"]
        create <- map["created_at"]
        size <- map["size"]
        watcher <- map["watchers"]
    }
    
    var name : String?
    var url : String?
    var des : String?
    var create : String?
    var size : Int?
    var watcher : Int?
    
    
}
