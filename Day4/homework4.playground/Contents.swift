import UIKit

// Филистович Руслан

//1. Создать класс Account с полями balance (Double) и number (Int). (Желательно сделать их private).
//Создайте конструктор аккаунта по его номеру, сумму в конструкторе при этом устанавливайте = 0.
//Создайте у аккаунта 2 метода, deposit и withdraw, в которые соответственно передаются суммы на пополнение и снятие. В этих методах реализуйте изменение баланса на соответствующую сумму.
//Сделайте функции, возвращающие текущий баланс и номер аккаунта.


class Account {
    private var balance: Double
    private let number: Int
    
    init(number: Int) {
        self.number = number
        balance = 0
    }
    
    func deposit(balance: Double) {
        self.balance += balance
    }
    
    func withdraw(balance: Double) {
        self.balance -= balance
    }
    func checkBalance() -> Double {
        return balance
    }
    func accountNumber() -> Int {
        return number
    }
}

let ruslan = Account(number: 1)
ruslan.deposit(balance: 450)
ruslan.checkBalance()
ruslan.withdraw(balance: 0.50)
ruslan.checkBalance()
ruslan.accountNumber()

//2. Используя класс Account в качестве базового, создать 2 дочерних класса SavingsAccount и CurrentAccount. У SavingsAccount должно быть новое свойство interest типа Double, так же private, создайте функции для установки/получения interest.

class SavingsAccount: Account {
    private var interest: Double = 0.0
    
    func newInterest(newInterest: Double) {
        interest += newInterest
    }
    
    func getInterest() -> String {
        return "interest = \(interest)"
    }
}

let person = SavingsAccount(number: 2)
person.getInterest()
person.newInterest(newInterest: 3.3)
person.getInterest()


// У CurrentAccount должно быть поле overdraftLimit, при снятии (withdraw) с текущего аккаунта, если текущий баланс + overdraftLimit превышает снимаемую сумму - вывести в консоль ошибку, а сумму не изменяйте.

class CurrentAccount: Account {
    var overdraftLimit: Double = 1.5
    override func withdraw(balance: Double) {
        if (checkBalance() - balance) < overdraftLimit {
            print("Сумма снятия больше минимально допустимого остатка")
        } else {
            super.withdraw(balance: balance)
        }
    }
}

let test = CurrentAccount(number: 4)
test.deposit(balance: 34)
test.withdraw(balance: 20)


//3*.  Создайте класс банк, у которого есть массив аккаунтов (в котором могут хранится любые типы аккаунтов и создайте для банка методы для открытия новых аккаунтов каждого типа, открытые аккаунты должны добавляться к массиву уже существующих.

class Bank {
    var clients = [Account]()
   
    func newAccount(number: Int) {
         let newClient = Account(number: number)
        clients.append(newClient)
    }
    
    func newCurrentAccount(number: Int) {
        let newClient = CurrentAccount(number: number)
        clients.append(newClient)
    }
    
    func newSavingsAccount(number: Int) {
        let newClient = SavingsAccount(number: number)
        clients.append(newClient)
    }
    
    
    //4*. Добавьте для Банка методы пополнения аккаунта по номеру на указанную в методе сумму и снятия суммы с указанного по номеру аккаунта (в методы передавать номер аккаунта, а не весь аккаунт)

    func plusBalance(sum: Double, num: Int) {
        for client in clients {
            if client.accountNumber() == num {
                client.deposit(balance: sum)
            }
        }
    }
    
    func minBalance(sum: Double, num: Int) {
        for client in clients {
            if client.accountNumber() == num {
                client.withdraw(balance: sum)
            }
        }
    }
}

let client = Bank()
client.newAccount(number: 23)
client.plusBalance(sum: 10, num: 23)
client.plusBalance(sum: 10, num: 22)
print(client.clients[0].checkBalance())

