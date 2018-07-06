//: Playground - noun: a place where people can play

import UIKit

func findMax (a: Int, b: Int) -> Int {
    return a > b ? a : b
}
func findMin (a: Int, b: Int) -> Int {
    return a < b ? a : b
}

var result : (Int, Int) -> Int = findMax
print("Ket qua: \(result(3,4))")
result = findMin
print("Ket qua: \(result(3,4))")

func getMinMax (isMin : Bool) -> ((Int, Int) -> Int) {
    return isMin ? findMin : findMax
}
var choice = getMinMax(isMin: true)
print(choice(3,4))
choice = getMinMax(isMin: false)
print(choice(3,4))
