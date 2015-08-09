//: Playground - noun: a place where people can play

import UIKit

//para imprimir
var str = "Hello, playground"
println(str)

//Use let to make a constant and var to make a variable
var myVariable = 42
myVariable = 50
let myConstant = 42

///“If the initial value doesn’t provide enough information (or if there is no initial value), specify the type by writing it after the variable, separated by a colon.

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70

//“para convertir un valor de diferente tipo"
let label = "The width is "
let width = 94
let widthLabel = label + String(width)

//“existe otra manera mas sencilla de hacer lo de arriba”
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

//“para crear armar y acceder a ellos con el rindex o llave(keys)"
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"] = "Public Relations"

//“To create an empty array or dictionary, use the initializer syntax.”
//“par acrear un vacío array o diccionario,usar la siguiente sintaxis”
let emptyArray = [String]()
let emptyDictionary = [String: Float]()

//"Si la información de tipo se puede inferir, puede escribir una matriz vacía como [] y un diccionario vacío como [:] -. Por ejemplo, cuando se establece un nuevo valor para una variable o pasar un argumento a una función"
shoppingList = []//array
occupations = [:]//diccionario

//“Use if and switch to make conditionals, and use for-in, for, while, and do-while to make loops. Parentheses around the condition or loop variable are optional. Braces around the body are required.”

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
println(teamScore)

//“se puede utilizar junto con if y let para trabajar con valores”

var optionalString: String? = "Hello"
println(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

//un buen uso de let en un switch
let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
}

//a este no le entendi
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
println(largest)

//ejemplo de uso de bucles loops
var n = 2
while n < 100 {
    n = n * 2
}
println(n)

var m = 2
do {
    m = m * 2
} while m < 100
println(m)

//uso de .. y ...

var firstForLoop = 0
for i in 0..<4 {
    firstForLoop += i
}
println(firstForLoop)

var secondForLoop = 0
for var i = 0; i < 4; ++i {
    secondForLoop += i
}
println(secondForLoop)

//para crear una funcion
func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
}
greet("Bob", "Tuesday")


//como pasar una tupla a una funcion
func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics([5, 3, 100, 3, 9])
println(statistics.sum)
println(statistics.2)

//pasanoo una colleccion
func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(42, 597, 12)

//las funciones se pueden anidar
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

//regresamos una funcion como valor
func makeIncrementer() -> (Int -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

//un funcion puede tomar otra funcion como uno de sus parametros
func hasAnyMatches(list: [Int], condition: Int -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(numbers, lessThanTen)


//no le entendi
numbers.map({
(number: Int) -> Int in
let result = 3 * number
return result
})
//tampoco a este
let mappedNumbers = numbers.map({ number in 3 * number })
println(mappedNumbers)

//los puedes invocar con el numero de referencia index con sorted te permite hacerlo en lugar del nombre sorted te lo ordena
let sortedNumbers = sorted(numbers) { $0 > $1 }
println(sortedNumbers)

//crecion deuna clase o objeto con sus variables y funciones
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

//creando una instancia de una clase
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

//creando una instancia de una clase con inicializador
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) \(name) sides."
    }
}
var name = "Eduardo"
var newShape = NamedShape(name: name)
newShape.numberOfSides = 7
newShape.simpleDescription()

//subclase
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() ->  Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
test.area()
test.simpleDescription()



//otro ejemplo de subclase con getter y setter
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get {
            return 3.0 * sideLength
            }
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
println(triangle.perimeter)
triangle.perimeter = 9.9
println(triangle.sideLength)





//Este es muy importante entenderlo willSet
//Si no es necesario para calcular la propiedad, pero todavía tiene que proporcionar el código que se ejecuta antes y después de fijar un nuevo valor, utilice willSet y didSet. Por ejemplo, la clase de abajo asegura que la longitud del lado de su triángulo es siempre la misma que la longitud del lado de su cuadrado.
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
println(triangleAndSquare.square.sideLength)
println(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
println(triangleAndSquare.triangle.sideLength)


//diferentes formas o juegos de parametros verlo en ejemplo
class Counter {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes times: Int) {
        count += amount * times
    }
}
var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)


//manejando   ?
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength



//Utilice enumeración para crear una enumeración. Al igual que las clases y todos los demás tipos con nombre, enumeraciones pueden tener métodos asociados con ellos.

enum Rank: Int {
    
    case Ace = 1
    
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        
        switch self {
            
        case .Ace:
            
            return "ace"
            
        case .Jack:
            
            return "jack"
            
        case .Queen:
            
            return "queen"
            
        case .King:
            
            return "king"
            
        default:
            
            return String(self.rawValue)
            
        }
        
    }
    
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue
if let convertedRank = Rank(rawValue: 2) {
    let threeDescription = convertedRank.simpleDescription()
}




//Add a color() method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.
enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()



//"Agregar un método a la tarjeta que crea una baraja completa de tarjetas, con una carta de cada combinación de rango y su ejemplo."
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()



//Proporcionar el valor en bruto cuando se define la enumeración.
//    
//Por ejemplo, considere el caso de solicitar el amanecer y el atardecer hora de un servidor. El servidor o bien responde con la información o responde con algo de información de error ".

enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure...  \(error)"
}




//Protocols and Extensions
//Use protocol to declare a protocol.
//Classes, enumerations, and structs can all adopt protocols.

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription



//Write an extension for the Double type that adds an absoluteValue property.
//You can use a protocol name just like any other named type—for example, to create a collection of objects that have different types but that all conform to a single protocol. When you work with values whose type is a protocol type, methods outside the protocol definition are not available.
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
println(7.simpleDescription)
let protocolValue: ExampleProtocol = a
println(protocolValue.simpleDescription)
// println(protocolValue.anotherProperty)  // Uncomment to see the error