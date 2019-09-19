
func isEven(number: Int) -> Bool {
  return number % 2 == 0
}

let evens = Array(1...10).filter(isEven)
//print(evens)


// Functions

let values = [2.0,4.0,5.0,7.0]
var squares: [Double] = []
for value in values {
  squares.append(value*value)
}

let squares2 = values.map({ (value: Double) -> Double in
  return value * value
})

let squares3 = values.map {$0 * $0}

let strings = values.map { String($0) }

let items = [2.0,4.0,5.0,7.0]
let reduceRes = items.reduce(1.0, *)


let total = items.reduce(0.0, +)
// 28.0

let codes = ["abc","def","ghi"]
let text = codes.reduce("", +)
// "abcdefghi"

let results = [[5, 2, 7], [4,8], [9,1,3]]
let allResults = results.flatMap { $0}
//print(allResults)
// [5, 2, 7, 4, 8, 9, 1, 3]


let chaining = results.flatMap { $0 }
  .filter { $0 <= 5 }
  .map {String($0)}

//print(chaining)

// Optionals

// 1. Optionals can be nil or have a value
// 2. You need to unwrap optionals to safely use them

let name: String? = nil ?? "Tolic"
print(name)


let batman: String = "once told me!"
print(batman)


let somebody = name ?? batman
print(somebody)

//let score: Int = nil
//print(score)



protocol Nameable {
  var name: String? {get set}
}

class Vehicle: Nameable {
  var passengers: Int = 4
  var name: String?
  
  func ride() -> String {
    return "WRRROOOOM"
  }
}

let car = Vehicle()
print(car.passengers)
print(car.name)

car.name = "Maserati"
print(car.name)

let email: String? = "johndoe@example.com"

if email != nil {
  print(email!)
}

let emailNil: String? = nil
//print(emailNil!) // NEVER DO THIS!



let optionalUsername: String? = nil

if var username = optionalUsername {
  print(username)
}

if let score = Int("42") {
  print(score)
}

class Motorbike: Nameable {
  let wheels = 2
  var name: String?
}

let bmw = Vehicle()
var audi = bmw
audi = nil

bmw.name = "BMW"


let yamaha = Motorbike()
yamaha.name = "Yamaha"

let garage: [Nameable] = [bmw, yamaha]
let firstVehicle = garage[0]
let f = firstVehicle as? Vehicle
print(f?.ride())

for vehicle in garage {
  if let car = vehicle as? Vehicle {
    print("Vehicle with model: \(car.name), and no. passengers: \(car.passengers)")
  } else if let motorbike = vehicle as? Motorbike {
    print("Motorbike with model: \(motorbike.name), and wheels: \(motorbike.wheels)")
  }
}


// Errors

enum MagicWord: String {
  case abracadabra
  case alakazam
  case hocusPocus = "hocus pocus"
  case avadaKedavra = "avada kedavra"
  case polymorph
}

struct Spell {
  private(set) var magicWord: MagicWord = .abracadabra
  
  init?(word: String) {
    guard let magic = MagicWord(rawValue: word) else { return nil }
    self.magicWord = magic
  }

//  static func create(with word: String) -> Optional<Spell> {
//    if let incantation = MagicWord(rawValue: word) {
//      var spell = Spell()
//      spell.magicWord = incantation
//      return spell
//    }
//    else {
//      return nil
//    }
//  }
  
}


let abracadabra = Spell.create(with: "abracadabra")
let lumos = Spell.create(with: "lumos")
print(abracadabra)
print(lumos)


protocol Avatar {
  var avatar: String { get }
}

protocol Familiar: Avatar {
  var noise: String { get }
  var name: String? { get set }
  init(name: String?)
}

struct Toad: Familiar {
  init(name: String?) {
    self.name = name
  }
  
  var name: String?
  var noise  = "croak"
  var avatar = "🐸"
}

struct Cat: Familiar {
  init(name: String?) {
    self.name = name
  }
  
  var name: String?
  var noise  = "purrrr"
  var avatar = "🐱"
}

struct Hat {
  enum HatSize {
    case small
    case medium
    case large
  }
  
  enum HatColor {
    case black
  }
  
  var color: HatColor = .black
  var size: HatSize = .medium
  var isMagical = true
}

protocol Magical: Avatar {
  var name: String? { get set }
  var spells: [Spell] { get set }
  var familiar: Familiar? { get set }
  
  func turnFamiliarIntoToad() -> Toad
}

struct Witch: Magical {
  var avatar = "👩🏻"
  var name: String?
  var familiar: Familiar?
  var spells: [Spell] = []
  var hat: Hat?
  
  init(name: String?, familiar: Familiar?) {
    self.name = name
    self.familiar = familiar
    self.spells = [Spell(magicWord: .polymorph)]
  }
  
  init(name: String?, familiar: Familiar?, hat: Hat?) {
    self.init(name: name, familiar: familiar)
    self.hat = hat
  }
  
  func turnFamiliarIntoToad() -> Toad {
    if let hat = hat {
      if hat.isMagical { // When have you ever seen a Witch perform a spell without her magical hat on ? :]
        if let familiar = familiar {   // Check if witch has a familiar
          if let toad = familiar as? Toad {  // If familiar is already a toad, no magic required
            return toad
          } else {
            if hasSpell(ofType: .polymorph) {
              if let name = familiar.name {
                return Toad(name: name)
              }
            }
          }
        }
      }
    }
    return Toad(name: "New Toad")
  }
  
  func hasSpell(ofType type: MagicWord) -> Bool {
    let types = spells.map {$0.magicWord}
    return types.contains(type)
  }
}

enum PolymorphSpellError: Error {
  case hatMissingOrNotMagical
  case noFamiliar
  case familiarAlreadyAToad
  case spellFailed(reason: String)
  case spellNotKnownToWitch
}


//func turnFamiliarIntoToad() throws -> Toad {
//
//  // When have you ever seen a Witch perform a spell without her magical hat on ? :]
//  guard let hat = hat, hat.isMagical else {
//    throw ChangoSpellError.hatMissingOrNotMagical
//  }
//
//  // Check if witch has a familiar
//  guard let familiar = familiar else {
//    throw ChangoSpellError.noFamiliar
//  }
//
//  // Check if familiar is already a toad - if so, why are you casting the spell?
//  if familiar is Toad {
//    throw ChangoSpellError.familiarAlreadyAToad
//  }
//  guard hasSpell(ofType: .prestoChango) else {
//    throw ChangoSpellError.spellNotKnownToWitch
//  }
//
//  // Check if the familiar has a name
//  guard let name = familiar.name else {
//    let reason = "Familiar doesn’t have a name."
//    throw ChangoSpellError.spellFailed(reason: reason)
//  }
//
//  // It all checks out! Return a toad with the same name as the witch's familiar
//  return Toad(name: name)
//}

func exampleOne() {
  print("")
  
  let salem = Cat(name: "Salem Saberhagen")
  print(salem.noise)
  
  let witchOne = Witch(name: "Sabrina", familiar: salem)
  do {
    try witchOne.turnFamiliarIntoToad()
  }
  catch let error as PolymorphSpellError {
    handle(spellError: error)
  }
  catch {
    print("Something went wrong, are you feeling OK?")
  }
}

func handle(spellError error: PolymorphSpellError) {
  let prefix = "Spell Failed."
  switch error {
  case .hatMissingOrNotMagical:
    print("\(prefix) Did you forget your hat, or does it need its batteries charged?")
    
  case .familiarAlreadyAToad:
    print("\(prefix) Why are you trying to change a Toad into a Toad?")
    
  default:
    print(prefix)
  }
}

// exampleOne()


func exampleTwo() {
  print("") // Add an empty line in the debug area
  
  let toad = Toad(name: "Mr. Toad")
  toad.speak()
  
  let hat = Hat()
  let witchTwo = Witch(name: "Elphaba", familiar: toad, hat: hat)
  
  print("") // Add an empty line in the debug area
  
  let newToad = try? witchTwo.turnFamiliarIntoToad()
  if newToad != nil { // Same logic as: if let _ = newToad
    print("Successfully changed familiar into toad.")
  }
  else {
    print("Spell failed.")
  }
}

// exampleTwo()

func doSomethingMagical(magicalOperation: () throws -> String) rethrows -> String {
  return try magicalOperation()
}

//func speak() {
//  defer {
//    print("*cackles*")
//  }
//  print("Hello my pretties.")
//}
