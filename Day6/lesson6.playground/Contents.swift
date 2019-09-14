import UIKit

enum MagicError: Error {
    case spellFailure
}

func cast(_ spell: String) -> Result<String, MagicError> {
    switch spell {
    case "flowers": return .success("👺")
    case "stars": return .success("🎃")
    default:  return .failure(.spellFailure)
    }
}

//Equatable ==
//Comparable >=,<=,<,> ...

// () -> Void
