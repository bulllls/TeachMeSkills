import UIKit

// Филистович Руслан

//1. Переделать предыдущее ДЗ с использования наследования от класса Account, на использование протоколов Withdrawable/Depositable, сделать новый тип аккаунта, который нельзя пополнить (итого будет 4 разных типа аккаунта).
//(Учтите, что банк не сможет пополнять такие аккаунты и это надо предусмотреть в Bank)
//(Здесь озвучено только основное требование, как именно вы это будете реализовывать - решать вам. Используйте полученные знания + знания из книги)
protocol Withdrawable {
    func withdraw(withdraw: Double)
}

protocol Depositable {
    func deposit(deposit: Double)
}

protocol InfoAccount {
    var balance: Double { get set }
    var number: Int { get }
    
    func checkBalance() -> Double
    func checkNumber() -> Int
}

extension InfoAccount {
    
    func checkBalance() -> Double {
        return balance
    }
    func checkNumber() -> Int {
        return number
    }
    
}

protocol Interest {
    var interest: Double { get set }
    func getInterest() -> Double
    func setInterest(interest: Double)
   
}

typealias settingAccount = Withdrawable & Depositable & InfoAccount

class Account: settingAccount {
   
    var balance: Double
    let number: Int
    
    func withdraw(withdraw: Double) {
        balance -= withdraw
    }
    
    func deposit(deposit: Double) {
        balance += deposit
    }
    
    init(number: Int, balance: Double = 0) {
        self.number = number
        self.balance = balance
    }
}

class SavingsAccount: settingAccount, Interest {
   
    var balance: Double
    var number: Int
    var interest: Double
    
    func getInterest() -> Double {
        return interest
    }
    
    func setInterest(interest: Double) {
        self.interest += interest
    }
    
    func withdraw(withdraw: Double) {
        balance -= withdraw
    }
    
    func deposit(deposit: Double) {
        balance += deposit
    }
    init(number: Int, balance: Double = 0,  interest: Double = 2.5) {
        self.number = number
        self.balance = balance
        self.interest = interest
    }
}

class CurrentAccount: settingAccount {
    var overdraftLimit: Double
    var balance: Double
    var number: Int
    
    func withdraw(withdraw: Double) {
        if (checkBalance() - withdraw) < overdraftLimit {
            print("Сумма снятия больше минимально допустимого остатка")
        } else {
            balance -= withdraw
        }

    }
    func deposit(deposit: Double) {
        balance += deposit
    }
    
    init(number: Int, balance: Double = 0, overdraftLimit: Double = 2) {
        self.number = number
        self.balance = balance
        self.overdraftLimit = overdraftLimit
    }
    
}

class BlockedAccount: settingAccount {
    var balance: Double
    var number: Int
    
    func deposit(deposit: Double) {
        print("Аккаунт заблокирован. \(deposit) не принято")
    }
    func withdraw(withdraw: Double) {
        balance -= withdraw
    }
    
    init(number: Int, balance: Double = 0) {
        self.number = number
        self.balance = balance
    }
}

class Bank {
    var clients = [Int:settingAccount]()

    func newAccount(number: Int) {
        clients[number] = Account(number: number)
    }

    func newCurrentAccount(number: Int) {
       clients[number] = CurrentAccount(number: number)
    }

    func newSavingsAccount(number: Int) {
        clients[number] = SavingsAccount(number: number)
    }
    
    func newBlockedAccount(number: Int) {
        clients[number] = BlockedAccount(number: number)
    }

    func plusBalance(sum: Double, num: Int) {
        clients[num]?.deposit(deposit: sum)
    }
}

let client = Bank()
client.newSavingsAccount(number: 2)
client.plusBalance(sum: 12, num: 2)
client.newCurrentAccount(number: 3)
client.clients[3]?.withdraw(withdraw: 2)
client.newBlockedAccount(number: 5)
client.clients[5]?.deposit(deposit: 4)


//2. Если массив содержит числа, добавить массиву возможность посчитать сумму всех содержащихся в нем чисел.

extension Array where Array.Element == Int {
    func summ() {
        var summ = 0
        for num in self {
            summ += num
        }
        print(summ)
    }
}

let array = [1, 2, 4]
array.summ()

//3. Создайте протокол BackwardsPrintable, который объявляет функцию backwards, возвращающую строку.

protocol BackwardsPrintable {
    func backwards() -> String
}
// Расширьте String так, чтобы можно было вывести строку в обратном направлении.("Hello" -> "olleH")
extension String {
    func backwards() {
        for char in self.reversed() {
            print(char, terminator: "")
        }
        print("")
    }
}
let name = "Ruslan"
name.backwards()

//4. Сделайте калькулятор, с возможностью сложения/вычитания/умножения/деления. Для каждой операции внедрите через конструктор отдельную сущность, чтобы можно было динамически менять реализацию каждой из операций.

protocol Action {
    func sum(a: Int, b: Int) -> Int
    func div(a: Int, b: Int) -> Int
    func multi(a: Int, b: Int) -> Int
    func sub(a: Int, b: Int) -> Int
}

struct Calculator {
    private var action: Action!
    
    mutating func config(with action: Action) {
        self.action = action
    }
    
    func sum(a: Int, b: Int) -> Int {
        return action.sum(a: a, b: b)
    }

    func div(a: Int, b: Int) -> Int {
        return action.div(a: a, b: b)
    }

    func multi(a: Int, b: Int) -> Int {
        return action.multi(a: a, b: b)
    }

    func sub(a: Int, b: Int) -> Int {
        return action.sub(a: a, b: b)
    }
}

struct CaltTest: Action {
    func sum(a: Int, b: Int) -> Int {
        print("Test")
        return a + b
    }
    
    func div(a: Int, b: Int) -> Int {
        print("Test")
        return 1
    }
    
    func multi(a: Int, b: Int) -> Int {
        print("Test")
        return 1
    }
    
    func sub(a: Int, b: Int) -> Int {
        print("Test")
        return 1
    }
}

var ts = Calculator()
ts.config(with: CaltTest())
ts.sum(a: 2, b: 2)


//5. Создайте протокол Polygon, со свойствами sidesCount: Int, sideLength: Double и функцией getPerimeter.
//Создайте две сущности: Triangle c sidesCount = 3, и с sideLength задаваемой в конструкторе. Square - sidesCount = 4 и длина так же задается в конструкторе.
protocol Polygon {
    var sidesCount: Int { get }
    var sideLength: Double { set get }
    func getPerimeter(sidesCount: Int, sideLenght: Double) -> Double
}
extension Polygon {
    func getPerimeter(sidesCount: Int, sideLenght: Double) -> Double {
        return sideLength * Double(sidesCount)
    }
}

struct Triangle: Polygon {
    let sidesCount = 3
    var sideLength: Double
}

struct Square: Polygon {
    let sidesCount = 4
    var sideLength: Double
}

//Создайте сущность Canvas, с методами: а) возвращающим общee количество всех сторон из передаваемого массива Polyogn. б) возвращающим общую длину сторон всех Polygon.

let figur1 = Triangle(sideLength: 5)
let figur2 = Square(sideLength: 4)
var arrayPolygon = [Polygon]()
arrayPolygon.append(figur1)
arrayPolygon.append(figur2)

struct Canvas {
    func allSidesCount(arrayPolygon: [Polygon]) {
        var allSidesCount = 0
        for sidesCount in arrayPolygon {
            allSidesCount += sidesCount.sidesCount
        }
        print(allSidesCount)
    }
    
    func allSideLength(arrayPolygon: [Polygon]) {
        var allSideLength = 0.0
        for sidesLength in arrayPolygon {
            allSideLength += sidesLength.sideLength
        }
        print(allSideLength)
    }
}

let count = Canvas()
count.allSideLength(arrayPolygon: arrayPolygon)
count.allSidesCount(arrayPolygon: arrayPolygon)
