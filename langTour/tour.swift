println("Hello World!")

var myVariable = 42
myVariable = 50
let myConstant = 42

let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
let explicitFloat: Float = 4

let label = "This width is: "
let width = 94
let widthLabel = label + String(width)

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let orangeSummary = "I have \(oranges) oranges."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."
let float1: Float = 5
let float2: Float = 5.5
let name = "Mykal"
let floatCalc = "5.5 + 5 = \(flaot1 + float2)"
let nameString = "Hello \(name)"

var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
	"Malcom": "Captain",
	"Kaylee": "Mechanic",
]

occupations["Jayne"] = "Public Relations"

let emptyArray = (String)[]
let emptyDictionary = (String: Float)[]

let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
	if score > 50 {
		teamScore += 3
	} else {
		teamScore += 1
	}
}
teamScore

var optionalString: String? = "Hello"
optionalString == nil

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
	greeting = "Hello, \(name)"
} else if let name = nil {
	greeting = "Hello nobody."
}

let vegetable = "red pepper"
switch vegetable { 
	case "celery":
		let vegetableComment = "Add some raisins and make ants on a log."
	case "cucumber", "watercress":
		let vegetableComment = "That would make a good tea sandwich."
	case let x where x.hasSuffix("pepper"):
		let vegetableComment = "Is it spicy \(x)?"
	default:
		let vegetableComment = "Everything tastes good in soup."
}

let interstingNumber = ["Prime": [2, 3, 5, 7, 11, 13],
			"Fibbonacci": [1, 1, 2, 3, 5, 8],
			"Square": [1, 4, 9, 16, 25],
]

var largest = 0
for (kind, numbers) in interestingNumbers {
	for numbers in numbers {
		if number > largest {
			largest = number
		}
	}
}
largest

var n = 2
whine n < 100 {
	n = n * 2
}
n

var m = 2
do {
	m = m *2
} while m < 100
m

var firstForLoop = 0
for i in 0.. < 4 {
	firstForLoop += i
}
firstForLoop

var secondForLoop = 0
for var i = 0; i < 4; ++i {
	secondForLoop += i
}
secondForLoop

func greet(name: String, day: String) -> String { 
	return "Hello \(name), today is \(day)."
}
greet("Bob", "Tuesday")

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
	var min = scores[0]
	var max = scores[0]
	var sum = 0
	for scores in scores {
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
statistics.sum
statistics.2

func sumOf(numbers: Int...) -> Int {
	var sum = 0
	for number in numbers {
		sum += number 
	} 
	return sum
} 

sumOf()
sumOf(42, 597, 12)

func averageOf(numbers: Int...) -> Int {
	var sum = 0	
	var average = 0
	var objects = 0
	for number in numbers {
		objects = objects++;
		sum += number
	}

	average = sum / objects
	return average
}

averageOf()
averageOf(42, 597, 12)

func returnFifteen() -> Int {
	var y = 10
	func add() {
		y += 5
	}
	add()
	return y
}

returnFifteen()

func makeIncrementer() -> (Int -> Int) {
	func addOne(number: Int) -> Int {
		return 1 + number
	} 

	return addOne
} 

var increment = makeIncrementer()
increment(7)

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

var numbers = [20, 7, 19, 22]
hasAnyMatches(numbers, lessThanTen)

numbers.map({
	(number: Int) -> Int in 
	let result = 3 * number 
	return result
} 

numbers.map2({
	(number: Int) -> Int in
	if number % 2 == 0 {
		let result = 3 * number
	} else {
		let result = 0
	}

	return result
}

class Shape {
	var numberOfSides = 0
	func simpleDescription() -> String {
		return "A shape with \(numberOfSides) sides"
	}
}

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()

class NamedShape {
	var numberOfSides: Int = 0
	var name: String

	init(name: String) {
		self.name = name
	}

	func simpleDescription() -> String {
		return "A shape with \(numberOfSides) sides."
	}
}

class Square: NamedShape {
	var sideLength: Double
	
	init(sideLength: Double, name: String) {
		self.sideLength = sideLength
		super.init(name: name)
		numberOfSides = 4
	}

	func area() -> Double {
		return sideLength * sideLength
	}

	override func simpleDescription() -> String {
		return "A square with sides of length \(sideLength)."
	}

}

let test = Square(sideLength: 5.2, name: "My test square")
test.area()
test.simpleDescription()

class Circle: NamedShape {
	var radius: Double
	
	init(radius: Double, name: String) {
		self.radius = radius
		super.init(name: name)
		numberOfSides = 0
	}

	func area() -> Double {
		return radius * radius * 3.14
	}

	override func simpleDescription() -> String {
		return "A cricle with radius of length \(radius)."
	}
}

let test2 = Circle(radius: 5.2, name: "My test circle")
test2.area()
test2.simpleDescription()

class EquilaterealTriangle: NamedShape {
	var sideLength = 0.0

	init(sideLength: Double, name: String) {
		self.sideLength = sideLength
		super.init(name: name) 
		numberOfSides = 3;
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

var triangle = EquilateralTriangle(sideLength: 3.1, name: " a triangle")
triangle.perimeter
triangle.perimeter = 9.9
triangle.sideLength

class TriangleAndSquare	{
	var triangle: EquilateralTriangle {
		willSet {
			square.SideLength = newValue.sideLength
		}
	}
	
	var square: Square {
		willSet {
			triangle.sideLength = newValue.sideLength
		}
	}

	init(size: Dobule, name: String) {
		square = Square(sideLength: size, name: name)
		triangle = EquilateralTriangle(sideLength: size, name: name);
	}
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
triangleAndSquare.square.sideLength
triangleAndSquare.triangle.sideLength
triangleAndSquare.square = Sqaure(sideLength: 50, name: "larger square")
triangleAndSquare.triangle.sideLength

class Counter {
	var count: Int = 0
	func incrementBy(amount: Int, numberOfTimes times: Int) {
		count += amount * times
	}
}

var counter = Counter()
counter.incrementBy(2, numberOfTimes: 7)

enum Rank: Int {
	case Ace = 1
	case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten, Jack, Queen, King
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
				restun String(self.rawValue)
		}
	}
}

let ace = Rank.Ace
let aceRawValue = ace.rawValue

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

	func simpleColor() -> String {
		switch self {
			case .Spades:
				return "black"

			case .Clubs:
				return "black"
	
			case .Hearts:
				return "red"
	
			case .Diamonds
				return "red"
		}
	}
}

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.simpleColor()

struct Card {
	var rank : Rank
	var suit : Suit
	func simpleDescription() -> String {
		return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
	}
}

let threeOfSpades = Card(rank: .Three, suit: .Spades)
letThreeOfSpadesDescription = threeOfSpades.simpleDescription()

enum ServerResponse {
	case Result(String, String)
	case Error(String)
}

let success = ServerResponse.Result("6:00 am", "8:09pm")
let fail = ServerResponse.Error("Out of cheese.")

switch success {
	case let .Result(sunrise, sunset):
		let serverResponse = "Sunrise at \(sunrise) and sunset at \(sunset)."
	case let .Error(error):
		let serverResponse = "Failure... \(error)";

