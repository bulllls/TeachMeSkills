import UIKit
/// Филистович Руслан
import UIKit

///MARK: Weapon
protocol Weapon {
    var attackPower: Double { get set }
}
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
    var attackPower: Double
    func cut() {
        print("вжух")
    }
}
struct Crossbow: RangedWeapon {
    var attackPower: Double
    func fire() {
        print("пыщ пыщ")
    }
}
struct Cudgel: MeleeWeapon {
    var attackPower: Double
    func cut() {
        print("бум бум")
    }
}
struct Stick: RangedWeapon {
    var attackPower: Double
    func fire() {
        print("взж взж")
    }
}

struct Bow: RangedWeapon {
    var attackPower: Double
    func fire() {
        print("свз свз")
    }
}

let escalibur = Sword(attackPower: 29.0)
let epicCrossbow = Crossbow(attackPower: 14.0)
let bigCudgel = Cudgel(attackPower: 19.0)
let magicStick = Stick(attackPower: 27.0)
let woodenBow = Bow(attackPower: 18.0)

///MARK: Location
enum Location {
    case mountains
    case champaign
    case forest
    case gorge
}

///MARK: Weather
enum Weather {
    case windy
    case snow
    case rain
}


///MARK: PersonClass
enum PersonClass {
    case warrior
    case hunter
    case mage
    case priest
    case rogue
}

///MARK: Person
struct Person {
    let name: String?
    let weapon: Weapon
    let PersonClass: PersonClass
    let healter: Double
    let weather: Weather
    let losingWeather: Weather?
    let superLocation: Location
    let losingLocation: Location
    let superPower: Double
    let horse: Bool
}


let l1 = Person(name: "User 1", weapon: escalibur, PersonClass: .warrior, healter: 120.0, weather: .rain, losingWeather: nil, superLocation: .champaign, losingLocation: .mountains, superPower: 0.0, horse: true)
let l2 = Person(name: "User 2", weapon: escalibur, PersonClass: .warrior, healter: 120.0, weather: .rain, losingWeather: nil, superLocation: .champaign, losingLocation: .forest, superPower: 0.0, horse: true)
let l3 = Person(name: "User 3", weapon: woodenBow, PersonClass: .hunter, healter: 100.0, weather: .snow, losingWeather: .rain, superLocation: .mountains, losingLocation: .gorge, superPower: 0.0, horse: false)
let l4 = Person(name: "User 4", weapon: magicStick , PersonClass: .mage, healter: 100.0, weather: .rain, losingWeather: nil, superLocation: .forest, losingLocation: .champaign, superPower: 0.0, horse: false)
let l5 = Person(name: "User 5", weapon: bigCudgel, PersonClass: .priest, healter: 90, weather: .windy, losingWeather: .snow, superLocation: .gorge, losingLocation: .champaign, superPower: 0.0, horse: false)

let r1 = Person(name: "User 1", weapon: escalibur, PersonClass: .warrior, healter: 120.0, weather: .rain, losingWeather: nil, superLocation: .champaign, losingLocation: .mountains, superPower: 0.0, horse: true)

let r2 = Person(name: "User 2", weapon: escalibur, PersonClass: .warrior, healter: 120.0, weather: .rain, losingWeather: nil, superLocation: .champaign, losingLocation: .mountains, superPower: 0.0, horse: true)

let r3 = Person(name: "User 3", weapon: escalibur, PersonClass: .warrior, healter: 120.0, weather: .rain, losingWeather: nil, superLocation: .champaign, losingLocation: .mountains, superPower: 0.0, horse: true)

let r4 = Person(name: "User 4", weapon: escalibur, PersonClass: .warrior, healter: 120.0, weather: .rain, losingWeather: nil, superLocation: .champaign, losingLocation: .mountains, superPower: 0.0, horse: true)

let r5 = Person(name: "User 5", weapon: escalibur, PersonClass: .warrior, healter: 120.0, weather: .rain, losingWeather: nil, superLocation: .champaign, losingLocation: .mountains, superPower: 0.0, horse: true)
///MARK: Party
struct Party {
    var party = [Person?]()
    
    mutating func newPerson(person: Person) {
        party.append(person)
    }
    
    func sortNamePerson() -> [Person] {
        return party.compactMap{$0}.filter{$0.name != nil}.sorted{($0.name)! < ($1.name)!}
    }
    
    func sortAttackPower() -> [Person] {
        return party.compactMap{$0}.sorted{$0.weapon.attackPower < $1.weapon.attackPower}
    }
    
    func choiceAttakPower() -> [Person] {
        return party.compactMap{$0}.filter{ $0.weapon.attackPower > 5}
    }
    
    func sortWeapen<T>(_: T.Type) -> [Person] {
        return party.compactMap{$0}.filter{ $0.weapon is T }
    }

    func sortWeapenAndAttackPower<T>(_: T.Type, minPower: Int) -> [Person] {
        return party.compactMap{$0}.filter{$0.weapon is T}.filter{Int($0.weapon.attackPower) < minPower}
    }
    func allThePower() -> Double {
        var allThePower = 0.0
        for i in party {
            allThePower += i?.weapon.attackPower ?? 0.0
        }
        return allThePower
    }
    func allTheHealth() -> Double {
        var allTheHealth = 0.0
        for i in party {
            allTheHealth += i?.healter ?? 0.0
        }
        return allTheHealth
    }
}

var partyLeft = Party()
partyLeft.newPerson(person: l1)
partyLeft.newPerson(person: l2)
partyLeft.newPerson(person: l3)
partyLeft.newPerson(person: l4)
partyLeft.newPerson(person: l5)
var partyRight = Party()
partyRight.newPerson(person: r1)
partyRight.newPerson(person: r2)
partyRight.newPerson(person: r3)
partyRight.newPerson(person: r4)
partyRight.newPerson(person: r5)

struct Battle {
    
    func battle(armyLeft: Party, armyRight: Party, location: Location, weather: Weather) {
        
        var leftAllTheHealt = armyLeft.allTheHealth()
        var leftAllTheAttackPower = armyLeft.allThePower()
       
        var rightAllTheHealt = armyRight.allTheHealth()
        var rightAllTheAttackPower = armyRight.allThePower()
        
        
        for soldier in armyLeft.party {
            if soldier?.superLocation == location {
                leftAllTheHealt += ((leftAllTheHealt / 100) * 10)
            } else if soldier?.losingLocation == location {
                leftAllTheHealt -= ((leftAllTheHealt / 100) * 5)
            }
            if soldier?.weather == weather {
                leftAllTheAttackPower += ((leftAllTheAttackPower / 100) * 10)
            } else if soldier?.losingWeather == weather {
                leftAllTheAttackPower -= ((leftAllTheAttackPower / 100) * 5)
            }
        }
        
        for soldier in armyRight.party {
            if soldier?.superLocation == location {
                rightAllTheHealt += ((rightAllTheHealt / 100) * 10)
            } else if soldier?.losingLocation == location {
                rightAllTheHealt -= ((rightAllTheHealt / 100) * 5)
            }
            if soldier?.weather == weather {
                rightAllTheAttackPower += ((rightAllTheAttackPower / 100) * 10)
            } else if soldier?.losingWeather == weather {
                rightAllTheAttackPower -= ((rightAllTheAttackPower / 100) * 5)
            }
        }
    
         var r = 0
         while leftAllTheHealt > 0.0 || rightAllTheHealt > 0.0 {
            r = r + 1
            leftAllTheHealt -= rightAllTheAttackPower
            rightAllTheHealt -= leftAllTheAttackPower
            if leftAllTheHealt > rightAllTheHealt {
                print("\(r) Раунд! Побеждает LeftArmy cо здоровьем \(leftAllTheHealt) над RightArmy со здоровьем \(rightAllTheHealt)")
            } else if rightAllTheHealt > leftAllTheHealt {
                print("\(r) Раунд! Побеждает RightArmy cо здоровьем \(rightAllTheHealt) над LeftArmy со здоровьем \(leftAllTheHealt)")
            }
            
        }
        
    }
}
let battle = Battle()
battle.battle(armyLeft: partyLeft, armyRight: partyRight, location: .gorge, weather: .rain)

















