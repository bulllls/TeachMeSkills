import UIKit

var a = 9.9
let b = 10
var str = "Hello, playground"

let q: Int = 4
let w: Double = 4

//let q + w // error
let letDouble: Double
let letFloat: Float
//Структуры данных

var cart: [Any] = ["Apple", "Milk", "Cake"]
var numb = [1, 3, 4]

numb.append(4)
numb.remove(at: 3)
numb.count
print(numb)
cart.append("Bananas")
print(cart)

print("Item at 0 is: \(cart[0])")
cart.append(1)

let array = [String]()
var empyArrayOfString: [String] = []

var grades:Dictionary = ["Alice": 10,
              "Bob": 3]
grades["John"] = 5
grades["tesr"]
print(grades)

grades["Tom"] = 5
print(grades)

var empyDictionary: [String: Int] = [:]

//: MARK - Set

var set: Set = [1,2,3,4,5,6,7,8,9,9]
print(set)
set.insert(99)
print(set)
set.count

 Array - упорядоченность оступ по индексу
 Dictionary - доступ по ключу, неупорядоченность, хранит ключ значение
 Set - неупорядоченность, индивидуальность элементов


