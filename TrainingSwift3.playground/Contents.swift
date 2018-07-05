//: Playground - noun: a place where people can play

//import UIKit

var a = 3
if (a > 0) {
    print("So duong")
}

var b = -3
if (b > 0) {
    print("So duong")
} else {
    print("Ko phai so duong")
}

var c = -2
if (c > 0) {
    print("So duong")
} else if c < 0 {
    print("So am")
} else {
    print("Bang 0")
}

var d : Int?
d = 2
if let d = d {
    print(d)
}

var f : String {
    var d : Int?
    d = 2
    guard let e = d else {
        print("nil")
    }
    print(e)
    return ""
}


