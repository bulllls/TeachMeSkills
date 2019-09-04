import UIKit

// Филистович Руслан
//1. Создать перечисление с мастями карт (gloves, diamonds, hearts, spades) и перечисление с возможными картами (от двойки до туза( В - Jack, Д - Queen, K - King, T - Ace).

enum PlayingCards: String, CaseIterable {
    case gloves = "♣︎", diamonds = "♦︎", hearts = "♥︎", spades = "♠︎"
}

enum AllCards: Int, CaseIterable {
    case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace
}
print(AllCards.Ten.rawValue)


//    2. Создать структуру Карта, со свойствами масть/значение.

struct Card {
    var suit: PlayingCards
    let val: AllCards
    
    //    4. Сделать у карты переменную, возвращающую описание в виде ("Ace of ♠︎") (вот значки остальных мастей ♣︎, ♥︎, ♦︎)
    var description: String {
        print("\(val) of \(suit.rawValue)")
        return "\(val) of \(suit.rawValue)"
    }
    
    //    3.*** добавить для карты возможность определить "сильнее" ли она другой карты, либо слабее (без учета масти)
    func compare(comparisonСard: Card) {
        if val.rawValue > comparisonСard.val.rawValue {
            print("\(val) сильнее")
        } else if val.rawValue < comparisonСard.val.rawValue {
            print("\(comparisonСard.val) сильнее")
        } else {
            print("Карты равны")
        }
    }
    
    //    5*. Добавить карте функцию, с помощью которой можно будет изменить ее масть на другую
    mutating func newSuit(newSuit: PlayingCards) {
        suit = newSuit
    }
}

var cardOne = Card(suit: .diamonds, val: .Five)
let cardTwo = Card(suit: .hearts, val: .King)

cardOne.compare(comparisonСard: cardTwo)
cardTwo.description

cardOne.newSuit(newSuit: .gloves)
cardOne.description

//    6*. Создать переменную deck, в которой будет храниться массив из всех 52х карт
var deck = [Card]()
for suit in PlayingCards.allCases {
    for val in AllCards.allCases {
        deck.append(Card(suit: suit, val: val))
    }
}
print(deck.count)
