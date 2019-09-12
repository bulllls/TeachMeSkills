

// Polymorphism

class Account {
  func deposit(amount: Double) {
    print("Deposit to basic Account: \(amount)")
  }
}

class SavingsAccount: Account {
  override func deposit(amount: Double) {
    print("Deposit to Savings Account: \(amount)")
  }
}


let acc = Account()
//acc.deposit(amount: 5)

let savings: Account = SavingsAccount()
//savings.deposit(amount: 5)


func deposit(to account: Account, amount: Double) {
//  account.deposit(amount: amount)
}

deposit(to: acc, amount: 0)
deposit(to: savings, amount: 0)



// Protocols


protocol Flyable {
  func fly()
}

struct Eagle {
  //WingsContainable
  
  var wings = 2
}

let bird1 = Eagle() //Flyable
//bird1.fly()
//eagle.fly()



protocol WingsContainable {
  var wings: Int { get } //
}

struct Chicken: WingsContainable {
  var wings: Int = 2
}

struct Basket: WingsContainable {
  var wings: Int = 6
}

protocol WingsFlyable: Flyable {
  var wingsCount: Int { get }
}

var basket: WingsContainable = Basket()
//basket.wings = 4
print(basket.wings)

struct WhiteEagle: WingsFlyable {
  var wingsCount: Int = 2
  
  func fly() {
    
  }
  
}


let whiteEagle = WhiteEagle()
//whiteEagle.fly()
//print(whiteEagle.wings)

// Extensions

extension Chicken {
  func makeEgg() {
    print("New egg!")
  }
  
}

let chicken = Chicken(wings: 2)
chicken.makeEgg()


extension Eagle: Flyable {
  func fly() {
    print("Eagle flying!")
  }
}

struct Swift {}
//
extension Swift: WingsContainable {
  var wings: Int {
    return 2
  }
}

extension Swift: Flyable {
  func fly() {
    print("Fly")
  }
}

extension String {
  func printMe() {
    print(self)
  }
}

"Hello, world!".printMe()


// Protocol Extension

protocol Huntable {
  func hunt()
}

extension Huntable {
  func hunt() {
    print("I am hunting")
  }
}


extension Eagle: Huntable {
  func hunt() {
    print("EAGLE HUNTING!")
  }
}

let eagle: Huntable = Eagle()
eagle.hunt()








// Real world example

protocol CameraDataProvidable {
  var zoomFactor: Double { get }
}
//
extension CameraDataProvidable {
  var zoomFactor: Double {
    return 1.0
  }
}

protocol PhotoDataProvidable {
  func choosePhoto() -> String
}

struct LibraryDataProvider: PhotoDataProvidable {
  let name: String = "Photo"
  
  func choosePhoto() -> String {
    return "Picking photo from library"
  }
}

struct InternetDataProvider: PhotoDataProvidable {
  let name: String = "Internet"
  
  func choosePhoto() -> String {
    return "Picking photo from Internet"
  }
}

struct Camera {
  private let provider: CameraDataProvidable
  private let photoDataProvider: PhotoDataProvidable
  private var zoomFactor: Double = 1.0
  
  init(dataProvider: CameraDataProvidable,
       photoProvider: PhotoDataProvidable = LibraryDataProvider()) {
    self.provider = dataProvider
    self.photoDataProvider = photoProvider
  }
//
  mutating func setup() {
    zoomFactor = provider.zoomFactor
    print(zoomFactor)
  }
  
  func pickPhoto() -> String {
    return photoDataProvider.choosePhoto()
  }
}

struct ZoomedCameraDataProvider: CameraDataProvidable {
  var zoomFactor: Double {
    return 1.5
  }
}

struct DefaultCameraDataProvider: CameraDataProvidable {
  var zoomFactor: Double {
    return 1.0
  }
}

let zoomedCameraDataProvider = ZoomedCameraDataProvider()
let defaultProvider = DefaultCameraDataProvider()

struct TestPhotoProvider: PhotoDataProvidable {
  
  func choosePhoto() -> String {
    return "PHOTO CAPTURED"
  }
}

let provider = TestPhotoProvider()
var sut = Camera(dataProvider: defaultProvider,
                    photoProvider: provider)

if provider.choosePhoto() == sut.pickPhoto() {
  print("Test succed")
} else {
  print("TEST FAILED")
}

struct Summer {
  private var calculator: Calculator!
  
  mutating func config(with calculator: Calculator) {
    self.calculator = calculator
  }
  
  func sum(a: Int, b: Int) -> Int {
    return a + b // calculator.sum(a: a, b: b)
  }
}

protocol Calculator {
  func sum(a: Int, b: Int) -> Int
}

struct TestCalculator: Calculator {
  func sum(a: Int, b: Int) -> Int {
    print("SUM CALLED")
    return a + b
  }
}

var summer = Summer()
summer.config(with: TestCalculator())
summer.sum(a: 5, b: 3)

