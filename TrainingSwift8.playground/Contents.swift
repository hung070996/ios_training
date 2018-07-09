//: Playground - noun: a place where people can play

//import UIKit

//enum Direction {
//    case east
//    case west
//    case south
//    case north
//}

enum Direction : Int {
    case east = 1, west, south, north
    func description() {
        switch self {
        case .east:
            print("east: \(self.rawValue)")
        case .west:
            print("west: \(self.rawValue)")
        case .south:
            print("south: \(self.rawValue)")
        case .north:
            print("north: \(self.rawValue)")
        }
    }
}

var myDirection = Direction.west
myDirection = .north

enum Input {
    case complex (Int, Int)
    case string (String)
}

var input1 = Input.complex(1, 2)
var input2 = Input.string("abc")

switch input1 {
case var .complex(first, second):
    print("\(input1) is complex, \(first), \(second)")
case var .string (s):
    print("\(input1) is string, \(s)")
}

var a = Direction.north.rawValue
print(a)

var b = Direction.south
b.description()

