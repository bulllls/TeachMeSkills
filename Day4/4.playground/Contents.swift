import Foundation

// Struct

struct Notebook {
  var pagesCount: Int
  let color: String
  
  static let width = 10
  static let height = 20
  
  var area: Int {
    
    print("Calculating area...")
    let notebookWidth = Notebook.width
    let notebookHeight = Notebook.height
    return notebookWidth * notebookHeight * pagesCount
  }
  
  func printColor() {
    print("My color is \(color)")
  }
  
  mutating func getPage() -> Int {
    pagesCount -= 1
    return pagesCount
  }
}

// Class

class NotebookClass {
  var pagesCount: Int = 50
  let color: String = "black"
  
  var area: Int {
    print("Calculating area...")
    let width = 10
    let height = 20
    return width * height * pagesCount
  }
  
  func printColor() {
    print("My color is \(color)")
  }
  
  func getPage() -> Int {
    pagesCount -= 1
    return pagesCount
  }
}
//
//var myNotebookStruct = Notebook(pagesCount: 50, color: "black")
//var someonesNotebookStruct = myNotebookStruct
//someonesNotebookStruct.pagesCount -= 1
//print("My notebook struct: \(myNotebookStruct)")
//print("Someones notebook struct: \(someonesNotebookStruct)")
//
//let myNotebookClass = NotebookClass()
//let otherNotebookClass = myNotebookClass
//otherNotebookClass.pagesCount -= 1
//myNotebookClass.pagesCount -= 1
//
//print("My notebook class: \(myNotebookClass.pagesCount)")
//print("Other notebook class: \(otherNotebookClass.pagesCount)")

//
//
class Bird {
  let wings = 2

  func fly() {
    print("I'm flying")
  }
  
  var description: String {
    return "I'm an unknown Bird"
  }
}
//

class Vehicle {
  
  func go() {
    ride()
  }
  
  func ride() {
    
  }
}

let vehicle = Vehicle()

class Eagle: Bird {

  override var description: String {
    return "I am an EAGLE"
  }
//
//  func hunt() {
//    print("Eagle hunting")
//  }
}

class WhiteEagle: Eagle {
  
}

let eagle = WhiteEagle()
print(eagle.description)
//

class Chicken: Bird {
  
  var thickness: Double = 10

  func makeEgg() {
    print("New egg has come out!")
  }
}

let chicken = Chicken()
chicken.makeEgg()

class Kiwi: Bird {
}

let kiwi = Kiwi()
print(kiwi.wings)


// ARC

//class Person {
//  var name: String
//  weak var apartment: Apartment?
//
//  init(name: String) {
//    print("Person \(name) - start init")
//    self.name = name
//  }
//
//  deinit {
//    print("Person \(name) is being deinitialized")
//  }
//}
//
//
//class Apartment {
//  let unit: String
//  weak var tenant: Person?
//
//  init(unit: String) {
//    print("Apartment \(unit) - start init")
//    self.unit = unit
//  }
//
//  deinit {
//    print("Apartment \(unit) is being deinitialized")
//  }
//}

//var unit4A: Apartment?
//var john: Person?
////
//john = Person(name: "John Appleseed")
//john?.apartment = Apartment(unit: "4A")
//
//print(john!.apartment?.unit)

//
//john = nil
////print(unit4A!.tenant?.name)
//unit4A = nil
//print(unit4A)
//print(john)
