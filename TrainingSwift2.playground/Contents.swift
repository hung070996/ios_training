//: Playground - noun: a place where people can play

//Tuple

var tuple = (1, "two", [3,4])
print(type(of: tuple.0))
print(type(of: tuple.1))
print(type(of: tuple.2))

var tuple2 = (first: 5, second: [6,7], third: "eight")
print(tuple2.first)
print(tuple2.second)
print(tuple2.third)

var (me, you, our) = tuple2
print(me)
print(you)
print(our)

var (he, she, _) = tuple

// Optional
var a : Int? = 3
print(a)
print(a!)

if let a = a {
    print(a)
}
