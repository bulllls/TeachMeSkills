import UIKit
// MARK: Опционалы(либо сущ либо нет)
// чтобы получить доступ нужно проверить существование
//case let
// if let
// Errors

class Person1 {
    var residence: Residence1?
}

class Residence1 {
    var numberOfRooms = 1
}
let john1 = Person1()
//let roomCount = john.residence!.numberOfRooms -> ERROR

if let roomCount = john1.residence?.numberOfRooms {
    print("John - \(roomCount) room(s)")
} else {
    print("Unable to retrieve the number of rooms.")
}


john1.residence = Residence1()
if let roomCount = john1.residence?.numberOfRooms {
    print("John - \(roomCount) room(s)")
} else {
    print("Unable to retrieve the number of rooms.")
}


//// MARK: Определение классовых моделей для ОП

class Person {
    var residence: Residence?
}

class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("Общее количество комнат равно\(numberOfRooms)")
    }
    var address: Address?
}
class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}

class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buldingID() -> String? {
        if let buildingNumber = buildingNumber, let street = street{
            return "\(buildingNumber) \(street)"
        } else if buildingName != nil {
            return buildingName
        } else {
            return nil
        }
    }
}

//// MARK: Доступ к свойствам через ОП

let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress

func createAddress() -> Address {
    print("Function was called.")
    
    let someAddress = Address()
    someAddress.buildingNumber = "29"
    someAddress.street = "Acacia Road"
    
    return someAddress
}

john.residence?.address = createAddress()

////MARK: Вызов методов через ОП
if john.residence?.printNumberOfRooms() != nil {
    print("Есть возможность вывести комнаты")
} else {
    print("Нет возможности вывести компанты")
}
////MARK: Доступ к сабскриптам через ОП
if let firstRoomName = john.residence?[0].name {
    print("Перва компанта \(firstRoomName)")
} else {
    print("Не получить название")
}

let johnHouse = Residence()
johnHouse.rooms.append(Room(name: "Гостиная"))
johnHouse.rooms.append(Room(name: "Кухня"))
john.residence = johnHouse

if let firstRoomName = john.residence?[0].name {
    print("Название первой компанты \(firstRoomName).")
} else {
    print("не полчить название")
}

////MARK: Получение доступа к сабскрипту (индексу) опционального типа
var testScores = ["Dave": [86, 82, 84], "Ben": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Ben"]?[0] += 1
testScores["Brain"]?[0] = 72

////MARK: Соединение нескольких уровней ОП

if let johnStreet = john.residence?.address?.street {
    print("John's street name is \(johnStreet)")
} else {
    print("Unable to retrieve the address.")
}

let johnsAddress = Address()
johnsAddress.buildingName = "The Larches"
johnsAddress.street = "Laures Street"
john.residence?.address = johnsAddress

if let johnsStreet = john.residence?.address?.street {
    print("John's street name is \(johnsStreet)")
} else {
    print("Unable to retrieve the address.")
}

////MARK: Связывание методов в ОП с опциональными возвращаемыми значениями

if let buildingID = john.residence?.address?.buldingID() {
    print("John's building ID is \(buildingID)")
}

if let beginWithThe = john.residence?.address?.buldingID()?.hasPrefix("The") {
    if beginWithThe {
        print("Jonh's building ID with The")
    }else {
        print("Jonh's building ID NOT with The")
    }
}













// enumerated() берем и индекс и значение
