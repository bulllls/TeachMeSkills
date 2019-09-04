import UIKit
//Филистович Руслан


//#####//
//  1  //
//#####//

func equalNumbers(a: Int, b: Int, c: Int) {
    if a == b {
        print("There ARE two equal numbers a и b")
    } else if a == c {
        print("There ARE two equal numbers a и c")
    } else if b == c {
        print("There ARE two equal numbers b и c")
    } else {
        print("There are NO equal numbers")
    }
}
equalNumbers(a: 3, b: 3, c: 1)
//equalNumbers(a: 1, b: 2, c: 2)
//equalNumbers(a: 1, b: 4, c: 1)
//equalNumbers(a: 1, b: 2, c: 3)



let array = [3, 5, 6, 7, 88, 34, 54, 2, 15]
func equalNumbersArray(numbers: [Int]) {
    let set = Set(array)
    if set.count < numbers.count {
        print("В массиве есть дубли")
    } else {
        print("Дублей нет")
    }
}
equalNumbersArray(numbers: array)


//#####//
//  2  //
//#####//

func minNumber(a: Int, b: Int, c: Int, d: Int){


    if a < b && a < c && a < d {
        print("\(a) - наименьшее значение")
    } else if b < a && b < c && b < d {
        print("\(b) - наименьшее значение")
    } else if c < a && c < b && c < d {
        print("\(c) - наименьшее значение")
    } else {
        print("\(d) - наименьшее значение")
    }
}
minNumber(a: 1, b: 2, c: 3, d: 4)
//minNumber(a: 4, b: 3, c: 2, d: 1)
//minNumber(a: 4, b: 1, c: 3, d: 2)
//minNumber(a: 4, b: 3, c: 1, d: 2)


let array1 = [3, 5, 6, 7, 7, 88, 34, 54, 2, 10]

func minElementArray(a: [Int]) {
    var min = array1[0]
    for index in array1 {
        if index < min {
            min = index
        }
    }
    print("\(min) - минимальное значение в массиве")
}
minElementArray(a: array1)


//#####//
//  3  //
//#####//

func point(x1: Int, y1: Int, x2: Int, y2: Int, x: Int, y: Int) -> Bool {
    //координаты верхнего угла
    let x1 = x1
    let y1 = y1
    //координаты нижнего угла
    let x2 = x2
    let y2 = y2
    //координаты точки
    let x = x
    let y = y
    if (x > x2 && x < x1) && (y > y2 && y < y1) {
        print("Точка попадает в прямоугольник")
        return true
    } else {
        print("Данная точка не попадает в прямоугольник")
        return false
    }
}

point(x1: 6, y1: 4, x2: 1, y2: 1, x: 5, y: 2)
point(x1: 6, y1: 4, x2: 1, y2: 1, x: 2, y: 5)


//#####//
//  4  //
//#####//

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
        row += 2
        print("")
    }
}
paintTriangle(count: 7)


//#####//
//  5  //
//#####//

var fibArray = [1, 1]

func fibonacci(count: Int) {
    var indexArrayFib = 1
    for _ in 1...count {
        fibArray.append(fibArray[indexArrayFib] + fibArray[indexArrayFib - 1])
        indexArrayFib += 1
    }
    print(fibArray)
}
fibonacci(count: 7)


//#####//
//  6  //
//#####//

func sqr(count: Int) {
    var startNumber = 1
    for _ in 1...count {
        let sum = startNumber * startNumber
        print(sum)
        startNumber += 1
    }
}
sqr(count: 5)


//#####//
//  7  //
//#####//

func allPower() {
    var sum = 2
    if sum == 2 {
        print(1)
    }
    for _ in 1...10 {
        print(sum)
        sum = sum * 2
    }
}

allPower()


