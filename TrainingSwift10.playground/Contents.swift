//: Playground - noun: a place where people can play

import UIKit

class Person {
    var id : Int = 0
    var name : String = ""
    init(id : Int, name : String) {
        self.id = id
        self.name = name
    }
}

class Student : Person {
    var university : String = ""
    init(id: Int, name: String, uni: String) {
        super.init(id: id, name: name)
        self.university = uni
    }
}
