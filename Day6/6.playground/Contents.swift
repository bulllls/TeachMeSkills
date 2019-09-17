
func addInts(x: Int, y: Int) -> Int {
  return x + y
}

let intSum = addInts(x: 5, y: 8)
print(intSum)

func addDoubles(x: Double, y: Double) -> Double {
  return x + y
}

let doubleSum = addDoubles(x: 5.0, y: 8.0)
//

//func genericSum<T: Printable, U: Numeric>(x: T, y: U) -> Int {
//  return x + y
//}

protocol Printable {}
extension String: Printable {}
extension Int: Printable {}

//genericSum(x: 5, y: 7)
//genericSum(x: 2.1, y: 3.2)

func printInt(x: Int) {
  print(x)
}

func printDouble(x: Double) {
  print(x)
}


func printSmething<S>(x: S, y: S) {
  print("X: \(x). Y: \(y)")
}
printSmething(x: ["4"], y: ["6"])



let numbers: Array<Int> = [1, 2, 3]


enum MagicError: Error {
  case spellFailure
}

func cast(_ spell: String) -> Result<String, MagicError> {
  switch spell {
  case "flowers":
    return .success("💐") //
  case "stars":
    return .success("✨") //
  default:
    return .failure(.spellFailure)
  }
}

let result1 = cast("flowers") // .success("💐")
print(result1)
let result2 = cast("avada kedavra") // .failure(.spellFailure)
print(result2)


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

var q = Queue<Int>()

q.enqueue(newElement: 4)
q.enqueue(newElement: 2)

q.dequeue()
q.dequeue()
q.dequeue()



func pairs<Key, Value>(from dictionary: [Key: Value]) -> [(Key, Value)] {
  return Array(dictionary)
}

//let somePairs = pairs(from: ["minimum": 199, "maximum": 299])
//print(somePairs)
// result is [("maximum", 299), ("minimum", 199)]

//let morePairs = pairs(from: [1: "Swift", 2: "Generics", 3: "Rule"])
// result is [(1, "Swift"), (2, "Generics"), (3, "Rule")]

//
func mid<T: Comparable>(array: [T]) -> T? { //Comparable
  guard !array.isEmpty else { return nil }
  return array.sorted()[(array.count - 1) / 2]
}

//
mid(array: [3, 5, 1, 2, 4])

protocol Summable {
  static func +(lhs: Self, rhs: Self) -> Self
}

extension Int: Summable {}
extension Double: Summable {}
extension String: Summable {}

func add<T: Summable>(x: T, y: T) -> T {
  return x + y
}

let addIntSum = add(x: 1, y: 2) // 3
let addDoubleSum = add(x: 1.0, y: 2.0) // 3.0

let addString = add(x: "Generics", y: " are Awesome!!! :]")
print(addString)

extension Queue {
  func peek() -> Element? {
    return elements.first
  }
}

q.enqueue(newElement: 5)
q.enqueue(newElement: 3)
q.peek() // 5


//let message = Reward.treasureChest("💰").message
//print(message)

protocol Storage {
  associatedtype Item: Equatable
  var items: [Item] { set get }
  mutating func add(item: Item)
  var count: Int {get}
}

extension Storage {
  mutating func add(item: Item) {
    items.append(item)
  }
}

struct Food: Equatable {
  let taste: String
}

struct RestaurantStorage: Storage {
  var items: [Food] = [Food(taste: "sweet")]
  var count: Int {
    return items.count
  }
}

struct IntStorage: Storage {
  var items: [Int] = [1]
  var count: Int {
    return items.count
  }
}

func isEqual<S1: Storage, S2>(first: S1, second: S2) -> Bool where S1.Item == S2 {
  return first.items.first! == second
}

isEqual(first: IntStorage(), second: 2)


//func sum1() -> () {
//  print("Called sum")
//}
//
//func sum(x: Int, y: Int) {
//  print(x + y)
//}
//let first = sum1
//print(first())

// Closures

//let driving = {
//  print("I'm driving in my car")
//}

//func driving(by source: String) {
//  print("I'm driving in my \(source)")
//}

func travel(action: () -> Void) {
  print("I'm getting ready to go.")
 // driving(by: "HUMMER")
  action()
  print("I arrived!")
}
//

travel { print("Drive") }


var evens: [Int] = []
//for i in 1...10 {
//  if i % 2 == 0 {
//    evens.append(i)
//  }
//}
//print(evens)



//evens = Array(1...10).filter({ (argument) in return argument % 2 == 0
//})

print(evens)

evens = Array(1...10).filter({ (current) in current % 2 == 0 })

evens = Array(1...10).filter({ $0 % 2 == 0 })

//evens = Array(1...10).filter{ $0 % 2 == 0 })

evens = Array(1...10).filter { $0 % 2 == 0 }
