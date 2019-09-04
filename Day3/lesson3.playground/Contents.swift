import UIKit

// Mark: Enumerations

enum Season {
    case winter
    case spring
    case summer
    case autumn
}

let currentSeason: Season = .autumn

switch currentSeason {
    case .autumn: print("Сейчас осень")
    case .spring: print("Сейчас весна")
    case .summer: print("Сейчас лето")
    case .winter: print("Сейчас зима")
}

switch currentSeason {
    case .autumn: print("Сейчас осень")
    default: print("Сейча не осень")
}

enum Validation {
    case characterCount(Int)
    case symbolContained(String)
}

struct Notebook {
    let color: String
    var pagesCount: Int
}

let myNotebook = Notebook(color: "black", pagesCount: 50)

print(myNotebook)

