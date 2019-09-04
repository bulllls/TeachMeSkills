import UIKit
/*
1. Есть три значения a, b, c - проверить, есть ли среди них одинаковые значения (если есть - вывести в консоль "Есть одинаковые значения" если нет "Нет одинаковых значений) (* массив из 10 значений, проверить есть ли одинаковые значения в массиве)
 */
let a = 4
let b = 13
let c = 9

if a == b {
    print("Одинаковые значения a и b")
} else if a == c {
     print("Одинаковые значения a и c")
} else if b == c {
    print("Одинаковые значения a и c")
} else {
    print("Нет одинаковых значений")
}

let array = [3, 5, 6, 7, 7, 88, 34, 54, 2, 1]
let arraySorted = array.sorted {$0 < $1}
print(arraySorted)
var indexArray = 0
while indexArray < arraySorted.count - 1 {
    if arraySorted[indexArray] == arraySorted[indexArray + 1]{
        print("Повторяющееся число \(arraySorted[indexArray])")
        indexArray += 1
    }
    indexArray += 1
}

/*
2. Есть 4 значения a,b,c,d - вывести в консоль наименьшее из них (* найти наименьшее число в массиве из 10 значений)
 */
let a1 = 4
let b1 = 56
let c1 = 15
let d1 = 7

if a1 < b1 && a1 < c1 && a1 < d1 {
    print("\(a1) - наименьшее значение")
} else if b1 < a1 && b1 < c1 && b1 < d1 {
    print("\(b1) - наименьшее значение")
} else if c1 < a1 && c1 < b1 && c1 < d1 {
    print("\(c1) - наименьшее значение")
} else {
    print("\(d1) - наименьшее значение")
}
 
let array1 = [3, 5, 6, 7, 7, 88, 34, 54, 2, 1]
let arraySorted1 = array1.sorted {$0 < $1}
print("\(arraySorted1[0])- наименьшее число в массиве")

/*
3. Даны координаты x1, y1 - координаты левого верхнего угла прямоугольника, и x2, y2 - нижнего правого угла прямоугольника. Определить попадает ли точка x, y в данный прямоугольник, результат вывести в консоль
*/

//координаты верхнего угла
let x1 = 6
let y1 = 4
//координаты нижнего угла
let x2 = 1
let y2 = 1
//координаты точки
let x = 5
let y = 2
if (x > 1 && x < 6) && (y > 1 && y < 4) {
    print("Точка попадает в прямоугольник")
} else {
    print("Данная точка не попадает в прямоугольник")
}

 /*
4. Дано значение N - вевести в консоль квадрат из символов (*) размером N x N. (подсказка: чтобы не переносить печать на новую строку используйте print("*", terminator: ""); для перевода печати на новую строку используйте print("") ).
 (*** нарисовать треугольник, высотой N, где на вершине 1, на второй строке 3, на третьей 5 и т. д. )
 */

func paintSquare(count: Int) {
    for _ in 1...count {
        for _ in 1...count {
        print("*", terminator: "")
            }
        print("")
        }
    }
 paintSquare(count: 3)


func paintTriangle(count: Int) {
    var row = 1
    for _ in 1...count {
        for _ in 1...row {
            print("*", terminator: "")
        }
        row += 1
        print("")
    }
}
paintTriangle(count: 7)
 /*
5. *Вывести в консоль N первых чисел Фибоначчи (Первые 2 числа Фибоначчи = 1, каждое последующее число - сумма двух предыдущих)
 */
var fibArray = [1, 1]
func fibonacci (count: Int) {
  var indexArrayFib = 1
    for _ in 1...count {
        fibArray.append(fibArray[indexArrayFib] + fibArray[indexArrayFib - 1])
        indexArrayFib += 1
    }
    print(fibArray)
}
fibonacci(count: 7)
 /*
5. Вывести в консоль N первых чисел, из которых можно извлечь квадратный корень (1, 4, 9 и т. д.)
 */
func sqr(count: Int) {
   var startNumber = 1
    for _ in 1...count {
        let sum = startNumber * startNumber
        print(sum)
        startNumber += 1
    }
}
sqr(count: 5)

 
 
 /*
6. Вывести в консоль все степени числа 2, до 10 (1024) включительно
*/
var sum = 2
for _ in 1..<10 {
    sum = sum * 2
    print(sum)
}







































//// MARK: Control Flou
//let truth: Bool = true
//let lie: Bool = false
//
//if truth {
//    print("This is true.")
//}
//if lie {
//    print("We will not see this")
//}
//// if выполняет блок кода если выражение истина(true)
//if !truth {
//    print("This is also true!")
//}
//// оператор (!) перед бул инвертирует ее значения тоесть true => false, false => true.
//let a = 10
//let b = 5
//a == b
//let check = a == b
//
//let a1 = 9
//let b1 = 4
//let c1 = 7
//
//let aIsGreaterThanB = a != b
//// AND - &&
//// OR - ||
//
////let tern = (bool) ? 10 : 0
//let isGoalScored: Bool = true
//let points = isGoalScored ? 2 : 0
//
//
//for pocket in [1, 2, 3] {
//    print(pocket)
//}
//for index in 12..<16 {
//    print(index)
//}
//// Switch
//let coin = 50
//switch coin {
//    case 10: print("10 ")
//    case 50: print("50")
//    default: print("also")
//}
//
////let os where operationSi
////hasSuffix()
////hasPrefix()
//
//
////while index < 5 {
////    index += 1
////    print(index)
////}
//func getAge() -> Int {
//    return 2
//}
//let myAge = getAge()
//func sum(a: Int, b: Int) -> Int {
//   return  a + b
//}


let truth = true
let lie = false

//if true {
//  print("This is true")
//  print("Another statement")
//}

//if false {
//  print("We will not see this")
//}
//
//print("Passed false")
//
////
//if !false {
//    print("This is also true!")
//}
//
//


//if a != b {
//  print("A NOT equals b")
//}

////
//if a > b && a > c {
//    print("A is the biggest number")
//}
//
//if (c > a || c > b) {
//    print("C is bigger than at least one other number")
//}
//
//

let a = 4
let b = 8
let c = 8

//
let aIsGreaterThanB = a > b
let aIsLowerThanB = a < b

// For

//let pockets = [12, 7, 5, 10, 24, 9]

//var sum = 0
//print("Sum before checking pockets: \(sum)")
//for pocket in pockets {
//    sum = sum + pocket
//    print(sum)
//}
//print("Total sum: \(sum)")

//for grade in grades.values {
//  print(grade)
//}

//for index in a...b {
//    print(index)
//}
//
//let grades = ["Alice": 10, "Bob": 7, "John": 5]
//
//for (student, grade) in grades {
//    print("\(student) grade is \(grade)")
//}
//
let money = ["Alice": [10, 5, 7, 4], "Bob": [3, 5, 6 ,8], "John": [12, 54, 53, 26]]

//for (student, pockets) in money {
//  if student != "Bob" { break }
//  print("Bob money: \(pockets)")
//}

// Switch

//let coin = 5
//
//switch coin {
//case 10:
//    print("Not enough money")
//case 20:
//    print("Not enough money")
//case 50:
//    print("Dispense water")
//case 200:
//    print("Change is \(200 - coin)")
//default:
//    print("Unknown coin")
//}


//
//let operatingSystem = "macOS"
//
//switch operatingSystem {
//case "Windows":
//    print("Microsoft developed Windows")
//case "Android":
//    print("Google developed Android")
//case let os where operatingSystem.hasSuffix("OS"):
//    print("Apple developed \(os)")
//default:
//    print("Unknown developer")
//}

// Repeat/While

//var index = 5
//
//while index < 5 {
//  print("Index is: \(index)")
//  index += 1
//}
//
//var repeatIndex = 5
//
//repeat {
//    print("Repeat Index is: \(repeatIndex)")
//    repeatIndex += 1
//} while repeatIndex < 5


// Functions
//
func fly() {
    print("I'm flying!")
}
//

for i in 0...10 {
  fly()
}

//
//
//
func getAge() -> Int {
  print("Get age called")
    return 27
}
//let myAge = getAge()
////
//print(getAge())

//
func sum(a: Int, b: Int) -> Int {
  let sum = a + b
  return 12.2
}


//let result = sum(a: 5, b: 7)
//print(result)
//
//func fly(height: Int) {
//  print("I'm flying \(height) meters high!")
//}

fly(height: 20)
//
//
//print(result)
