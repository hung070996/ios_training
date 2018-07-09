//: Playground - noun: a place where people can play

//import UIKit

struct Student {
    var id : Int = 1
    var name : String = ""
    var age : Int = 20
    
    init() {
        id = 0
        name = ""
        age = 0
    }
    
    init(id : Int, name : String, age : Int) {
        self.id = id
        self.name = name
        self.age = age
    }
    
    func description() -> String {
        return "id = " + String(id) + ", name = " + name + ", age = " + String(age)
    }
    
    mutating func addAge(number : Int) {
        age += number
    }
}

var s = Student()
s.addAge(number: 5)
print(s.age)

class Machine {
    var id : Int = 0
    var name : String = ""
    var weight : Int = 0
    
    init(id : Int, name : String, weight : Int) {
        self.id = id
        self.name = name
        self.weight = weight
    }
    
    convenience init(des : String) {
        self.init(id: 0, name: des, weight: 0)
    }
    
    lazy var price : Int = {
        return weight * 2
    }()
}

var m = Machine(id: 1, name: "abc", weight: 10)
print(m.price)



