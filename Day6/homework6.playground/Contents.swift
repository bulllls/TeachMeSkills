import UIKit
//1. Расширьте созданную на занятии Queue так, чтобы добавить ей свойство isHomogeneous, которая проверяет, одинаковые ли элементы в Queue или нет.

struct Queue<Element: Comparable> {
    private var elements: [Element] = []
    mutating func enqueue(newElement: Element) {
        elements.append(newElement)
    }
    mutating func dequeue() -> Element? {
        guard !elements.isEmpty else { return nil }
        return elements.remove(at: 0)
    }
}

extension Queue {
    mutating func isHomogeneou() -> Bool {
        self.elements.sort(){$0 < $1}
        let a = elements
        if a[0] == a[a.count - 1] {
            return true
        } else {
            return false
        }
    }
}
//1*. Добавьте для Queue возможность сравнить ее с другой Queue.  Две Queue считаются равными, если в них хранятся одинаковые элементы.
extension Queue {
    mutating func allItemsMatch(a: Queue) -> Bool {
        self.elements.sort(){$0 < $1}
        let sortedArray = a.elements.sorted {$0 < $1}
        if self.elements.count != sortedArray.count {
            return false
        }
        for i in 0..<self.elements.count {
            if self.elements[i] != sortedArray[i] {
                return false
            }
        }
        return true
    }
}

var text = Queue<String>()
text.enqueue(newElement: "Hi")
text.enqueue(newElement: "Hi")
var text2 = Queue<String>()
text2.enqueue(newElement: "Hi")
text2.enqueue(newElement: "Hi")

var people = Queue<Int>()
people.enqueue(newElement: 6)
people.enqueue(newElement: 7)
people.enqueue(newElement: 2)
people.enqueue(newElement: 6)
people.isHomogeneou()
var people2 = Queue<Int>()
people2.enqueue(newElement: 16)
people2.enqueue(newElement: 17)
people2.enqueue(newElement: 11)
people2.enqueue(newElement: 16)

people.allItemsMatch(a: people2)
text.allItemsMatch(a: text2)

//2. Есть функция:
//переделайте ее так, чтобы она была не глобальной функцией, а функцией массива. (Принимала только аргумент predicate)
extension Array{
    func myFilter<T>(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in self {
            if predicate(i as! T) {
                result.append(i as! T)
            }
        }
        return result
    }
}
let ints = [1,2,3,4,5,6,7,8,9,10]
let q =
ints.myFilter{$0 % 2 != 0}

//3. Создайте протокол Factory, (фабрика, которая может производить разные типы продуктов) у фабрики должен быть метод create, который создает требуемый продукт.

protocol Factory {
    var typeName: String { get set }
    func create()
    func type() -> Int
}
protocol Speed {
    var speed: Int { get set }
    
}
protocol Material {
    var material: String { get set }
}
//Добавьте возможность сравнить фабрики по принципу производят ли они одни и те же продукты, или разные типы продуктов.
extension Factory {
    func compareFactory(a: Factory) {
        if self.type() == a.type() {
            print("Однотипные продукты")
        } else {
            print("Продукты разного типа")
        }
    }
    func create() {
        storage.append(self)
    }
}
struct Furniture: Factory, Material {
    var material: String
    var typeName: String
    func type() -> Int {
        return 2
    }
}

struct Car: Factory, Speed {
    var speed: Int
    var typeName: String
    func type() -> Int {
        return 1
    }
}

var storage = [Factory]()

var car = Car(speed: 240, typeName: "Машина")
car.create()

var sofa = Furniture(material: "wood", typeName: "Диван")
sofa.create()

sofa.compareFactory(a: car)

//4. Вы разрабтываете role-playing game, в которой есть оружие ближнего и дальнего боя. Оружие ближнего боя имеет метод cut, оружие дальнего боя fire.
//Создайте протокол Weapon и расширьте его так, чтобы при создании оружия (sword - меч, crossbow - арбалет) по умолчанию для каждого из них были реализованы свойства canCut: Bool, и canFire: Bool.

protocol Weapon {
    var canCut: Bool { get set }
    var canFire: Bool { get set }
}

struct RangedWeapons: Weapon {
    var canCut: Bool = false
    var canFire: Bool = true
    func fire() {
        print("тра-та-та")
    }
}

struct MeleeWeapons: Weapon {
    var canCut: Bool = true
    var canFire: Bool = false
    func cut() {
        print("вжих")
    }
}


//5. Создайте функцию callNTimes, приниающую число N, и другую функцию, которая выполняет принимаемую функцию N раз.
func callNTimes(n: Int, c: ()->Void){
    for _ in 1...n {
        c()
    }
}
callNTimes(n: 5, c: { print("5") })

//6*. Создайте функцию, принимающую 2 массива с неким типом данных и замыкание, которая будет объединять данные в массивах в один массив на основании переданного замыкания (как в задании 2). (Массивы считайте одинаковой длины, возвращать функция должна массив такой же длины)

let array1 = [1,2,3,4,5]
let array2 = [6,7,8,9,10]

func myFilter<T>(arr1: [T], arr2: [T], predicate:(T) -> Bool) -> [T] {
    var result = [T]()
    for i in (arr1 + arr2) {
        if predicate(i) {
            result.append(i)
        }
    }
    return result
}
let s =
myFilter(arr1: array1, arr2: array2, predicate: {$0 % 2 == 0})
