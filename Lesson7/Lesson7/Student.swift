//
//  Student.swift
//  Lesson7
//
//  Created by Do Hung on 7/17/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit

class Student: NSObject {
    var id : Int!
    var name : String!
    var age : Int!
    override init() {
        
    }
    init(name : String, age : Int) {
        self.name = name
        self.age = age
    }
    convenience init(id : Int, name : String, age : Int) {
        self.init(name: name, age: age)
        self.id = id
    }
}
