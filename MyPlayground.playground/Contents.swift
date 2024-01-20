import UIKit

var greeting = "Hello, playground"

var array: Array<Any> = [4, 53, "my string"]
//var array2: Array<Int> = [4, 53, "string"]
var array2: [Any] = [4, 53, "string"]

var fl = Float()
var fl2 = Float(23.234)

var opt1: Float?
var opt2: Float?

opt1 = 23.9
opt2 = 99

var finOpt: Float = opt1!/opt2!

for (i, any) in array.enumerated() {
    if i%2 == 0{
        print(any)
    }
}

var myDict: Dictionary<String, Any> = ["hi": 99, "never": "back down", "isTrue": true]
print()
print()
for (string, any) in myDict {
    print("key: \(string)")
    print("value: \(any)")
}

// Enums
enum Pie: Int {
    case apple = 45
    case pumpkin
    case cherry
}

let pieRawValue = Pie.apple.rawValue
if let pieType = Pie(rawValue: pieRawValue) {
    print(pieType)
}

var somePie = Pie.apple
//somePie = Pie.pumpkin
//somePie = Pie.cherry

// Switch Case
var name: String
switch somePie {
case .apple:
    name = "apple"
case .cherry:
    name = "cherry"
case .pumpkin:
    name = "pumpkin"
}
print(name)


var someNum = -45
switch someNum {
case 1 ... 10:
    print("ok")
case 11 ... 20:
    print("doing better")
case 21 ... 30:
    print("picking up now")
case 31 ... 40:
    print("oh baby, c'mon!")
case _ where someNum > 40:
    print("the best!")
default:
    print("anything else I just can't tell")
}


// Closures
let compareAscending = { (i: Int, j: Int) -> Bool in
    return i < j
}

compareAscending(3,4)

var nums = [2, 55, 9, 0, -24, 66]

nums.sort(by: compareAscending)

for (i, val) in nums.enumerated(){
    print("\(i):\(val)")
}

