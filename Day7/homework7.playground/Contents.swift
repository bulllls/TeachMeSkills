import UIKit
//1. Вы продолжаете разрабатывать небольшую рпг из прошлого занятия! На этот раз нужно создать персонажей.
//Для создания персонажа вам понадобится решение задания 4 из прошлой работы.

protocol Weapon {
    //Дополните Weapon так, чтобы у каждого оружия было свойство attackPower: Double.
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
let escalibur = Sword(attackPower: 9.0)
let epicCrossbow = Crossbow(attackPower: 4.0)

//Создайте структуру персонажа, у каждого персонажа есть имя, оружие и класс
enum classPerson {
    case warrior
    case hunte
    case mage
    case priest
    case rogue
}
struct Person {
    let name: String
    let weapon: Weapon
    let classPerson: classPerson //(всего может быть 5 классов персонажей: warrior, hunter, mage, priest, rogue).
}

let P1 = Person(name: "User1", weapon: epicCrossbow, classPerson: )
let P2 = Person(name: "User2", weapon: escalibur, classPerson: "hunter")
let P3 = Person(name: "User3", weapon: epicCrossbow, classPerson: "warrior")
let P4 = Person(name: "User4", weapon: epicCrossbow, classPerson: "warrior")
let P5 = Person(name: "User5", weapon: escalibur, classPerson: "hunter")

//Создайте струкртуру Party, которая содержит несколько персонажей.
struct Party {
    var party = [Person]()
    
    mutating func newPerson(person: Person) {
        party.append(person)
    }
    
    //Для Party добавьте возможность отсортировать персонажей по имени,
    func sortNamePerson() -> [Person] {
        return party.sorted{$0.name < $1.name}
    }
    
        //либо по attackPower их оружия.
    func sortAttackPower() -> [Person] {
        return party.sorted{$0.weapon.attackPower < $1.weapon.attackPower}
    }
   
    //Добавьте возможность вернуть только персонажей с attackPower больше чем некоторое значение.
    func choiceAttakPower(maxAttak: Double, minAttak: Double) -> [Person] {
        var resultPerson = [Person]()
        for user in party {
            if user.weapon.attackPower <= maxAttak && user.weapon.attackPower >= minAttak {
                resultPerson.append(user)
            }
        }
        return resultPerson
    }
    
    //Добавьте возможность вернуть только персонажей с оружием дальнего/ближнего боя.
    func sortWeapen(rangedWeapon: Bool, meleeWeapon: Bool) -> [Person] {
        var resultPerson = [Person]()
        for person in party{
            if rangedWeapon && person.weapon.canFire {
                resultPerson.append(person)
            }
            if meleeWeapon && person.weapon.canCut {
                resultPerson.append(person)
            }
        }
        return resultPerson
    }
    
    //Скомбинируйте две предыдущие функции чтобы получить персонажей только ближнего/дальнего боя и attackPower больше или меньше некоторого значения.
    func sortWeapenAndAttackPower(rangedWeapon: Bool, meleeWeapon: Bool, maxAttak: Double, minAttak: Double) -> [Person] {
        var resultPerson = [Person]()
        for person in party{
            if person.weapon.attackPower <= maxAttak && person.weapon.attackPower >= minAttak {
                if rangedWeapon && person.weapon.canFire {
                    resultPerson.append(person)
                }
                if meleeWeapon && person.weapon.canCut {
                    resultPerson.append(person)
                }
            }
            
        }
        return resultPerson
    }
}

var p = Party()
p.newPerson(person: P1)
p.newPerson(person: P2)
p.newPerson(person: P3)
p.newPerson(person: P4)
p.newPerson(person: P5)

p.sortAttackPower()
p.sortNamePerson()

p.choiceAttakPower(maxAttak: 6, minAttak: 4)
p.sortWeapen(rangedWeapon: false, meleeWeapon: true)

p.sortWeapenAndAttackPower(rangedWeapon: true, meleeWeapon: false, maxAttak: 6, minAttak: 4)











//2*. Переделайте структуру персонажа так, чтобы все его свойства стали опциональными, а Party содержала массив опциональных персонажей. Для того чтобы предыдущее задание продолжало работать как требуется, вам необходима еще одна функция compactMap. Найдите ее описание в документации и посмотрите в чем ее отличие от функции map, которую мы разбирали.


var arr = [String?]()
arr = ["2", "1", "3", nil]
//arr.compactMap(str in Int(str))

let possibleNumbers = ["1", "2", "three", "///4///", "5"]

let mapped: [Int?] = possibleNumbers.map { str in Int(str) }
// [1, 2, nil, nil, 5]

let compactMapped: [Int] = possibleNumbers.compactMap { str in Int(str) }
// [1, 2, 5]
print(mapped, compactMapped)


//а почему бы для классов не использовать enum?
//для фильтра по силе атаки можно было бы использовать filter.
//func sortWeapen(rangedWeapon: Bool, meleeWeapon: Bool) -> [Person]
//эта функция имеет слишком много вариантов, лучше переписать ее как две отдельные функции, или передавать один параметр (например тип оружия).
//ну и да, здесь тоже предполагалось использование высших функций
//
////Скомбинируйте две предыдущие функции чтобы получить персонажей только ближнего/дальнего боя и attackPower больше или меньше некоторого значения.
//
//ну и здесь код уже сложно читать, ты упустил самое главное слово в задании - скомбинируйте. если ты обратишь внимание - у тебя код повторяется в нескольких местах, а это самое плохое что может быть
