//: Playground - noun: a place where people can play

import UIKit

@objc protocol StreetLegal {
    var numberWheel : Int {
        get
    }
    var isActive : Bool {
        get set
    }
    func turnLeft()
    @objc optional func turnRight()
}

class Bicycle : StreetLegal {
    var numberWheel: Int = 2
    
    var isActive: Bool = true
    
    func turnLeft() {
        print("Turn left")
    }
}
