//1. Расширьте созданную на занятии Queue так, чтобы добавить ей свойство isHomogeneous, которая проверяет, одинаковые ли элементы в Queue или нет.
//1*. Добавьте для Queue возможность сравнить ее с другой Queue.  Две Queue считаются равными, если в них хранятся одинаковые элементы.
//
//2. Есть функция:
//func myFilter<T>(source: [T], predicate:(T) -> Bool) -> [T] {
//  var result = [T]()
//  for i in source {
//    if predicate(i) {
//      result.append(i)
//    }
//  }
//  return result
//}
//переделайте ее так, чтобы она была не глобальной функцией, а функцией массива. (Принимала только аргумент predicate)
//
//3. Создайте протокол Factory, (фабрика, которая может производить разные типы продуктов) у фабрики должен быть метод create, который создает требуемый продукт.
//Добавьте возможность сравнить фабрики по принципу производят ли они одни и те же продукты, или разные типы продуктов.
//
//4. Вы разрабтываете role-playing game, в которой есть оружие ближнего и дальнего боя. Оружие ближнего боя имеет метод cut, оружие дальнего боя fire. Создайте протокол Weapon и расширьте его так, чтобы при создании оружия (sword - меч, crossbow - арбалет) по умолчанию для каждого из них были реализованы свойства canCut: Bool, и canFire: Bool.
//
//5. Создайте функцию callNTimes, приниающую число N, и другую функцию, которая выполняет принимаемую функцию N раз.
//


struct Queue<T: Hashable>: Equatable {
  let items: [T]
  
  var isHomogeneous: Bool {
    return Set(items).count == 1
  }
}

let ints = [1, 2, 4, 5]
let intsSec = [1, 4, 2, 5]
let q1 = Queue(items: ints)
let q2 = Queue(items: intsSec)
print(q1 == q2)

extension Array {
  func myFilter(predicate: (Element) -> Bool) -> [Element] {
    return self.filter(predicate)
  }
}

let result = [1, 2, 3, 4, 5, 6, 7, 8].myFilter { $0 % 2 == 0}
print(result)

protocol Factory {
  associatedtype Product
  func create() -> Product
}

func compare<F1: Factory, F2: Factory>(factory1: F1, factory2: F2) -> Bool where F1.Product == F2.Product {
  return true
}

struct Car {
  let wheels: Int
}


struct CarFactory: Factory {

  func create() -> Car {
    return Car(wheels: 4)
  }
}

struct Furniture {
  let color: String
}

struct FurnitureFactory: Factory, Equatable {
  
  func create() -> Furniture {
    return Furniture(color: "black")
  }
}

let bmw = CarFactory()
let lada = CarFactory()
let zov = FurnitureFactory()
//compare(factory1: bmw, factory2: zov)


protocol Weapon {}

extension Weapon {
  var canCut: Bool {
    return self is MeleeWeapon
  }
  
  var canFire: Bool {
    return self is RangedWeapon
  }
}

protocol RangedWeapon: Weapon {
  func fire()
}

protocol MeleeWeapon: Weapon {
  func cut()
}

struct Sword: MeleeWeapon {
  func cut() {
    print("вжух")
  }
  
}

struct Crossbow: RangedWeapon {
  func fire() {
    print("пыщ пыщ")
  }
  
}

let escalibur = Sword()
let epicCrossbow = Crossbow()
print(type(of: escalibur))
escalibur.canCut
escalibur.canFire
escalibur.cut()

epicCrossbow.canCut
epicCrossbow.canFire
epicCrossbow.fire()

func callNTimes(n: Int, function: () -> Void) {
  for _ in 1...n {
    function()
  }
}

//6*. Создайте функцию, принимающую 2 массива с неким типом данных и замыкание, которая будет объединять данные в массивах в один массив на основании переданного замыкания (как в задании 2). (Массивы считайте одинаковой длины, возвращать функция должна массив такой же длины)

func getTwoArrays<T>(first: [T], second: [T], predicate: (T, T) -> T ) -> [T] {
  var result: [T] = []
  for (index, element) in first.enumerated() {
    let resultElement = predicate(element, second[index])
    result.append(resultElement)
  }
  return result
}

let res = getTwoArrays(first: ints, second: intsSec) { (f, s) -> Int in
  print("Combining: \(f) and \(s)")
  print("result: \(f * s)")
  return f * s
}
print(res)
