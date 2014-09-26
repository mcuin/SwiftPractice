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


