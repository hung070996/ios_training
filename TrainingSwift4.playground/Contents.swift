//: Playground - noun: a place where people can play

import UIKit

 //LOOP

// 1. x...y
for i in 0...2 {
    print("Result:", i)
}

// 2. x...<y
print("\n")
for i in 0..<2 {
    print("Result:", i)
}

// 3. Array
print("\n")
let numbers = [1,3,4,7,9]
for i in numbers {
    print("Result:", i)
}

// 4. Array[index...]
print("\n")
for i in numbers[2...] {
    print("Result:", i)
}

// 5. Array[...index]
print("\n")
for i in numbers[...1] {
    print("Result:", i)
}

// 6. Array[..<index]
print("\n")
for i in numbers[..<3] {
    print("Result:", i)
}

// 7. stride
print("\n")
for i in stride(from: 1, to: 10, by: 2) {
    print("Result:", i)
}

// 8. _
print("\n")
for _ in 1...3 {
    print("Hello World")
}

// 9. Array.forEach
print("\n")
let names = ["Le", "Tuan", "Leo", "Hulk"]
names.forEach { name in
    print("Name:", name)
}

// 10. while
var x = 1
while x < 4 {
    print("Hello")
    x += 1
}
