//: Playground - noun: a place where people can play

import UIKit

extension Double {
    var toKm : Double {
        return self/1000
    }
    var toCm : Double {
        return self*1000
    }
    func square () -> Double {
        return self*self
    }
}

var height = 12.3.toCm
print(height)
var width = 6000.0.toKm
print(width)
print(width.square())

