import Darwin

//MARK: task 1, 2
enum Figure {
    
    enum Name: String {
        case King = "King"
        case Queen = "Queen"
        case Knight = "Knight"
        case Rook = "Rook"
        case Bishop = "Bishop"
        case Pawn = "Pawn"
    }
    enum Color : String {
        case White = "White"
        case Black = "Black"
    }

    enum Vertical : Int {
        case One = 1
        case Two = 2
        case Three = 3
        case Four = 4
        case Five = 5
        case Six = 6
        case Seven = 7
        case Eight = 8
    }
    
    enum Horizontal : Character {
        case A = "A"
        case B = "B"
        case C = "C"
        case D = "D"
        case E = "E"
        case F = "F"
        case G = "G"
        case h = "H"
    }
}

typealias Chess = (name: Figure.Name, positionH: Figure.Horizontal, positionV: Figure.Vertical, color: Figure.Color)

var whiteKing = Chess(.King, .A, .One, .White )

var blackQueen = Chess(.Queen , .B , .Three , .Black )
var blackKing = Chess(.King, .E, .Five, .Black)

var figureArray = [whiteKing, blackKing, blackQueen]

func printFigures(array: [Chess]) {
    for value in array {
        print("figure: \(value.name.rawValue), \tcolor: \(value.color.rawValue) \tposotion: \(value.positionH.rawValue)\(value.positionV.rawValue)")
    }
}

//MARK: task 3

printFigures(array: figureArray)

func dictionary(array: [Chess]) -> [String : (name: Figure.Name, color: Figure.Color)] {
    
    var dict = [String : (name: Figure.Name, color: Figure.Color)]()
    
    for value in array {
        
        dict["\(value.positionH)\(value.positionV.rawValue)"] = (value.name, value.color)
    }
    
    return dict
}

//print(dictionary(array: figureArray))

func printBoard(figures: [Chess])  {
    
    let alphabet = ["A", "B", "C", "D", "E", "F", "G", "H"]
    let white = "\u{25A1}"
    let black = "\u{25A0}"
    
    let dictFigure = dictionary(array: figures)

        print(" ", terminator: " ")
    for c in alphabet {
        print(c, terminator: " ")
    }
    print()
    for i in 1...8 {
        print("\(i)", terminator: " ")
        for j in 1...8 {
            
            
            if dictFigure["\(alphabet[i-1])\(j)"] != nil {
                
                let figure = dictFigure["\(alphabet[i-1])\(j)"]
                
                switch figure {
                    
                case _ where figure?.name == .King:
                    figure?.color == .White ? print("\u{2654}", terminator: " ") : print("\u{265A}", terminator: " ")
                    
                case _ where figure?.name == .Queen:
                    figure?.color == .White ? print("\u{2655}", terminator: " ") : print("\u{265B}", terminator: " ")
                    
                case _ where figure?.name == .Knight:
                    figure?.color == .White ? print("\u{2658}", terminator: " ") : print("\u{265E}", terminator: " ")
                    
                case _ where figure?.name == .Rook:
                    figure?.color == .White ? print("\u{2656}", terminator: " ") : print("\u{265C}", terminator: " ")
                    
                case _ where figure?.name == .Bishop:
                    figure?.color == .White ? print("\u{2657}", terminator: " ") : print("\u{265D}", terminator: " ")
                    
                case _ where figure?.name == .Pawn:
                    figure?.color == .White ? print("\u{2659}", terminator: " ") : print("\u{265F}", terminator: " ")
                    
                    
                default: break
                }
                
                
            } else {
                i % 2 == j % 2 ? print(white, terminator: " ") : print(black, terminator: " ")
            }
            
            
            
        }
        print()
    }
    


}
printBoard(figures: figureArray)


//MARK: task 4

let alphabetDict: [Character : Int] = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8]

func permit(figure: Chess, columm:  Character, line: Int) -> Bool {
    
    let a =  alphabetDict[columm]
    let b = alphabetDict[figure.positionH.rawValue]
    
    if a == nil || b == nil {
        return false
    }
    let colummIntNew = a!
    let colummIntOld = b!
    
    let name = figure.name
    let lineOld = figure.positionV.rawValue
    
    
    if (( 1 <= colummIntNew) && (colummIntNew <= 8)) ||
        ((1 <= line) && (line <= 8)) {
        
        switch name {
        
        case .King where abs(colummIntNew - colummIntOld) <= 1 && abs(line - lineOld) <= 1:
            
            
            return true
            
        case .Queen where (colummIntOld == colummIntNew) ||
            (lineOld == line )
            || (lineOld % colummIntOld == line % colummIntNew  && lineOld / colummIntOld == line / colummIntNew ):
            return true
        
        case .Bishop where (lineOld % colummIntOld == line % colummIntNew  && lineOld / colummIntOld == line / colummIntNew ):
            return true
            
        case .Rook where (colummIntOld == colummIntNew) ||
            (lineOld == line ) :
            return true
            
        case .Knight where (abs(line - lineOld) == 2 && abs(colummIntNew - colummIntOld) == 1) || (abs(line - lineOld) == 1 && abs(colummIntNew - colummIntOld) == 2):
            return true
            
        case .Pawn where colummIntNew - colummIntOld == 1 && line - lineOld == 1:
            return true
        
        default: break
        
        }
    }
    return false
    
}

func shift(figure: inout Chess, coordinates: (colomm: Figure.Horizontal, line: Figure.Vertical) ) -> Chess? {
    
    var newFigure : Chess?
    
    if permit(figure: figure, columm: coordinates.colomm.rawValue, line: coordinates.line.rawValue) {
        
        newFigure = Chess(figure.name, coordinates.colomm, coordinates.line, figure.color)
        
        print("figure \(newFigure?.color.rawValue) \(newFigure?.name.rawValue) moved to \(newFigure?.positionH.rawValue)\(newFigure?.positionV.rawValue)")
        
    } else {
        print("Error")
    }
    
    return newFigure
    
}

if let tmp = shift(figure: &figureArray[0], coordinates: (colomm: .B, line: .Two)) {
    figureArray[0] = tmp
}

if let tmp = shift(figure: &figureArray[1], coordinates: (colomm: .D, line: .Three)) {
    figureArray[1] = tmp
}

if let tmp = shift(figure: &figureArray[2], coordinates: (colomm: .E, line: .Six)) {
    figureArray[2] = tmp
}

printBoard(figures: figureArray)



// i know that its crutch
/*
enum Direction : String {
    case Left = "Left!"
    case Right = "Right!"
}

enum Action {
    case Walk(meters: Int)
    case Run(meters: Int, speed: Double)
    case Stop
    case Turn(direction: Direction)
}


var action  = Action.Run(meters: 20, speed: 15.0)

//action = .Stop

//action = .Walk(meters: 10)

//action = .Turn(direction: "Left") <-- wrong! It's error

//action = .Turn(direction: .Left)
var direction = Direction(rawValue: "Right!")!

action = .Turn(direction: direction)

switch action {
    
case .Stop: print("Stop")
    
//case .Walk(let meters):   print("Walk \(meters) meters")

case .Walk(let meters) where meters < 100:
    print("short walk")
case .Walk(_):
    print("long walk")
    
case Action.Run(meters: let m, speed: let s):
    print("run \(m) meters with \(s) speed")
    
case .Turn(let dir) where dir == .Left:
    print("Turn left")
    
case .Turn(let dir) where dir == .Right:
    print("Turn right")
    
default: break
}

// rawValue
print(Direction.Left.rawValue)

*/
