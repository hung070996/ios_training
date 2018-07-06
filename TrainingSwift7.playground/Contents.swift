//: Playground - noun: a place where people can play

import UIKit

var max = { (a: Int, b : Int) -> Int in
    return a > b ? a : b
}
print(max(1,2))

var min : (Int, Int) -> Int = {
    $0 < $1 ? $0 : $1
}
print(min(1,2))
