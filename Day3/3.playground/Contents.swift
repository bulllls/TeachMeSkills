import Foundation

// Enumerations

enum Season: CaseIterable {
  case winter
  case spring
  case summer
  case autumn
}

let currentSeason: Season = .autumn

switch currentSeason {
case .autumn: print("Cейчас осень")
case .spring: print("Cейчас весна")
case .summer: print("Сейчас лето")
case .winter: print("Сейчас зима")
//default: print("Сейчас ???")
}
//
//
switch currentSeason {
case .autumn: print("Cейчас осень")
default: print("Сейчас НЕ осень")
}
//
enum Validation {
  case charactersCount(Int)
  case symbolContained(String)
  case birthYearNotEnough(Int)
}
//
let password = "1234"
let emailAddress = "email.gmail.com"
let birthYear = 2009
//
//
let validations: [Validation] = [.birthYearNotEnough(2001), .symbolContained("@"), .charactersCount(6)]
//
for validation in validations {
  switch validation {
  case .symbolContained(let symbol):
    let isValidEmail = emailAddress.contains(symbol)
    print("Is email valid: \(isValidEmail)")
  case .charactersCount(let count):
    let message = password.count >= count ? "Password is strong enough" : "Password is weak!"
    print(message)
  case .birthYearNotEnough:
    if birthYear < 2010 {
    print("Over 18 - it's OK!")
    } else {
      print("Under 18 - Access denied!")
    }
  }

}

//

enum Month: Int {
  case jan = 1, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec

  func getSeason(after: Month) -> Season {
    switch after {
    case .dec, .jan, .feb: return .winter
    case .mar, .apr, .may: return .spring
    case .jun, .jul, .aug: return .summer
    case .sep, .oct, .nov: return .autumn
    }
  }
}

//
//
let eightsMonth = Month(rawValue: 8)

//
enum House: String, CaseIterable {
  case baratheon = "Ours is the Fury"
  case greyjoy = "We Do Not Sow"
  case stark = "Winter is Coming"
  case tully = "Family, Duty, Honor"
  case lannister = "Hear Me Roar!"
}

let houses = House.allCases

//
for house in House.allCases {
  print(house.rawValue)
}


// Struct

struct Notebook {
  var pagesCount: Int
  let color: String
  
  var area: Int {
    print("Calculating area...")
    let width = 10
    let height = 20
    return width * height * pagesCount
  }
  
  func printColor() {
    print("My color is \(color)")
  }
  
  mutating func getPage() -> Int {
    pagesCount -= 1
    return pagesCount
  }
}
//
var myNotebook = Notebook(pagesCount: 50, color: "black")
print("My notebook: \(myNotebook)")
var someonesNotebook = myNotebook
////someonesNotebook.color = "white"
//print("Someones notebook: \(someonesNotebook)")
//print("My notebook: \(myNotebook)")

//myNotebook.printColor()
//let yellow = Notebook(pagesCount: 1, color: "yellow")
//yellow.printColor()

//
//let remainingPages = myNotebook.getPage()
//print(myNotebook)
//print("Got one page: \(remainingPages)")

struct Page {
  let width: Int
  let height: Int
  let color: String
  
  init() {
    width = 10
    height = 20
    color = "white"
  }
}
//
let emptyPage = Page()
//print(emptyPage)

struct PagedNotebook {
  let color: String
  var pages: [Page]
  var pagesCount: Int {
    get {
      print("Getting pages count")
      return pages.count
    }
    set {
      print("Setting pages count to: \(newValue)")
      pages = Array(repeating: Page(), count: newValue)
    }
  }

}
//

var pagedNotebook = PagedNotebook(color: "black", pages: [Page()])
print(pagedNotebook.pagesCount)
//
pagedNotebook.pagesCount = 20
//print(pagedNotebook.pagesCount)
print(pagedNotebook.pages.count)
// static let width = 10
// static let height = 10
//
//{
//  willSet {
//    print("Setting pages to: \(newValue)")
//  }
//  didSet {
//    print("Pages is now: \(pages)")
//  }
//}
