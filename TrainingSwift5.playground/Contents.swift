//: Playground - noun: a place where people can play

import UIKit

// Declare array
var arr1 = [Int]()
var arr2 = Array(repeating: 2, count: 5)
var arr3 = Array(repeating: 1, count: 3)
var arr4 = arr2 + arr3
var arr5 : [String] = ["a", "b", "c"]
arr5.append("d")
arr5 += ["e"]
arr5 += ["f","g","h"]
var s = arr5[4]
arr5[1] = "t"

// Declare dictionary
var dict1 = [String : String]()
var dict2  : [String : String] = ["a" : "haha", "i" : "hii"];
dict2["e"] = "hehe"
dict2["a"] = "hahaha"
dict2.removeValue(forKey: "i")
dict2["a"] = nil

// Set
var set1 = Set<String>()
var set2 : Set<String> = ["dog", "cat", "pig"]
var set3 : Set = [1,2,3,4,5,6]
var set4 : Set = [1,3,5,7,9]
set3.union(set4).sorted()
set3.intersection(set4).sorted()
set3.symmetricDifference(set4).sorted()
set3.subtracting(set4).sorted()
