import UIKit
//Филистович Руслан

// #1
let priceLunch = 4.5
let pct = 5
var fullCost = ((priceLunch / 100) * Double(pct) + priceLunch)
print(fullCost)
// #2
var a = 5
var b = 3
print("a = \(a), b = \(b)")
var c = a
 a = b
 b = c
print("a = \(a), b = \(b)")
// #3
var newArray = [4, 8, 15, 16, 23, 42]
newArray[2] = 17
print(newArray)
// #4
//width = 8, height = 12, x = 2, y = 3
let width = 8
let height = 12
let x = 2
let y = 3
let perimeter = (width + height) * 2
let sqr = (width * height) - ((height - y) * (width - x))












//// #1
//let a: Double = 3.14
//var b = 2.5
//let c = a * b
//// #2
//let d: Int = 3
//let e: Double = 4.2
//let sqr = e * e
//let result = sqr + Double(d)
//// #3
//let myName: String = "Ruslan"
//let myAge: Int = 25
//print("Привет, меня зовут \(myName), мне \(myAge) лет.")
//// #4
//var array = [4, 5, 6]
//array.append(7)
////первый элемент
//print(array[0])
////последний элемент
//print(array[array.count - 1])
//// #5
//var dictionary: [Int: String] = [1: "1",
//                                 2: "2",
//                                 3: "3"
//]
//dictionary[4] = "4"
//// в строке ниже без "!" - показывает предупреждение
//print(dictionary[4]!)
//
