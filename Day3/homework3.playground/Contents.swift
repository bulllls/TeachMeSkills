import UIKit

//1. Создать перечисление с мастями карт (gloves, diamonds, hearts, spades) и перечисление с возможными картами (от двойки до туза( В - Jack, Д - Queen, K - King, T - Ace).

enum PlayingCard: String, CaseIterable {
    case gloves = "♣︎", diamonds = "♦︎", hearts = "♥︎", spades = "♠︎"
}

enum VoidCard: Int, CaseIterable {
    case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King, Ace
}
print(VoidCard.Ten.rawValue)


//    2. Создать структуру Карта, со свойствами масть/значение.

struct Card {
    var suit: PlayingCard
    let val: VoidCard
    
    //    4. Сделать у карты переменную, возвращающую описание в виде ("Ace of ♠︎") (вот значки остальных мастей ♣︎, ♥︎, ♦︎)
    var description: String {
        return "\(val) of \(suit.rawValue)"
    }
    
    //    3.*** добавить для карты возможность определить "сильнее" ли она другой карты, либо слабее (без учета масти)
    func compare(comparisonСard: Card) -> Bool {
        if val.rawValue > comparisonСard.val.rawValue {
            //print("\(val) сильнее")
            return true
        } else if val.rawValue < comparisonСard.val.rawValue {
            //print("\(comparisonСard.val) сильнее")
            return false
        } else {
            print("Карты равны")
            return false
        }
    }
    
    //    5*. Добавить карте функцию, с помощью которой можно будет изменить ее масть на другую
    mutating func newSuit(newSuit: PlayingCard) {
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
for suit in PlayingCard.allCases {
    for val in VoidCard.allCases {
        deck.append(Card(suit: suit, val: val))
    }
}
print(deck.count)
