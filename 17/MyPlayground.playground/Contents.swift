import Darwin

//MARK: easy level


enum Color : String {
    case White = "White"
    case Black = "Black"
}

class ChessDesk {
    
    let letter : [Character : Int] = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8]
             
    private func color(char: Character, digit: Int) -> Color {
        
        return letter[char]! % 2 == digit % 2 ? Color.Black : Color.White
    }
    
    subscript(char: Character, digit: Int ) -> String? {
        
        if letter[char] == nil || digit > 8 || digit < 1 {
            return nil
        }
        
        return color(char: char, digit: digit).rawValue
    }
    
}

let desk = ChessDesk()

desk["A", 1]

desk["A", 8]
desk["H", 1]
desk["C", 1]
desk["C", 0]

//MARK: middle level

enum Sell {
    case Empty
    case X
    case O
}

func createFieldXO(sizeX: Int, sizeY: Int) -> [String: Sell] {
    
    var dict = [String: Sell]()
    for i in 1...sizeX {
        for j in 1...sizeY {
            dict["\(i)\(j)"] = Sell.Empty
        }
    }
    return dict
}

class TikTacToe {
    
    static let sizeX = 3
    static let sizeY = 3
    
    var field = createFieldXO(sizeX: TikTacToe.sizeX, sizeY: TikTacToe.sizeY)
    
    func show() {
        
        for i in 1...TikTacToe.sizeX {
            for j in 1...TikTacToe.sizeY {
                
                switch field["\(i)\(j)"] {
                    
                case .Empty: Swift.print("◻️", terminator: " ")
                case .O: Swift.print("０", terminator: " ")
                case .X: Swift.print("ⅹ", terminator: " ")
                
                default: break
                }
                
            }
            print()
        }
    }
    
    subscript(symbol: Sell ,x: Int, y: Int) -> Bool {
        
        if 1...TikTacToe.sizeX ~= x && 1...TikTacToe.sizeY ~= y {
            
            field["\(x)\(y)"] = symbol
            return true
        } else {
            return false
        }
        
        
    }
}


let ticTacToe = TikTacToe()

ticTacToe.show()

ticTacToe[.X, 1, 1]
ticTacToe[.X, 2, 1]
ticTacToe[.X, 3, 1]
ticTacToe[.O, 2, 2]
ticTacToe[.O, 2, 3]
ticTacToe[.O, 3, 3]


ticTacToe.show()


//MARK: high level


struct Point {
    let x, y : Int
    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }
}

class Ship {
    
    enum Direction {
        case Vertical
        case Horizontal
    }
    enum ShipTypes : Int {
        case P1 = 1, P2, P3, P4
        var lenght: Int {
            return self.rawValue
        }
    }
    enum CellView : String {
        case Norm = "🔵"
        case Wound = "🟡"
        case Kill = "🔴"
    }
    subscript(state: CellView) -> Bool {
        
        var status = true
        for cell in cells {
            status = cell == state ? true : false
        }
        return status
        
    }
    
    var dir: Direction
    var pos: Point
    var type: ShipTypes
    var cells: [CellView]
    var state: CellView {
        return self[.Wound] ? .Kill : self[.Norm] ? .Norm : .Wound
    }
    init(type: ShipTypes, dir: Direction, pos: Point) {
        self.type = type
        self.cells = Array(repeating: .Norm , count: self.type.lenght)
        self.dir = dir
        self.pos = pos
    }
    subscript(index: Int) -> CellView {
        get {
            return cells[index - 1]
        }
        set {
            if cells[index - 1] == .Norm {
                cells[index - 1] = .Wound
            }
            if self.state == .Kill {
                for i in 0 ..< cells.count {
                    cells[i] = .Kill
                }
            }
        }
    }
    
}


class Field {
    struct Size {
        let weight, height : Int
        static var defaultSize: Size{return Size(weight: 10, height: 10)}
    }
    
    let size = Size.defaultSize
    var field : [[String]]
    var ships : [Ship] = []
    var hipPoint : [Point] = []
    
    init(ships: Ship...) {
        
        self.ships = ships
        field = Array(repeating: Array(repeating: "◻️", count: size.height), count: size.weight)
    }
    
    func putShipsInArray(i: Int, j :Int) -> String {
        var returnStr = field[i-1][j-1]
        for ship in ships {
            for idx in 0 ..< ship.type.lenght {
                switch ship.dir {
                    
                case .Vertical:
                    if ship.pos.y + idx == j && ship.pos.x == i {
                        return ship[idx + 1].rawValue
                    }
                case .Horizontal:
                    if ship.pos.y == j && ship.pos.x + idx == i {
                        return ship[idx + 1].rawValue
                    }
                default: break
                }
            }
        }
        return returnStr
    }
    
    func showField() {
        for w in 0 ... size.weight + 1 {
            for h in 0 ... size.height + 1 {
                1...size.weight ~= w && 1...size.height ~= h ? print(putShipsInArray(i: h, j: w), terminator: " ") : print("◼️", terminator: " ")
            }
            print()
        }
    }
    
    func shot(shoot: Point) {
        if self.hipPoint.filter({$0.x == shoot.x && $0.y == shoot.y}).first != nil {
            print("take a shot again")
            return
        }
        print("Shot: (x: \(shoot.x) y: \(shoot.y))")
        hipPoint.append(shoot)
        
        field[shoot.x - 1][shoot.y - 1] = "🔲"
        for ship in ships {
            for indx in 0 ..< ship.type.lenght {
                switch ship.dir {
                case .Vertical:
                    if ship.pos.y + indx == shoot.y && ship.pos.x == shoot.x {
                        ship[indx + 1] = .Wound
                    }
                case .Horizontal:
                    if ship.pos.y == shoot.y && ship.pos.x + indx == shoot.x {
                        ship[indx + 1] = .Wound
                    }
                default: break
                }
            }
        }
        showField()
    }
}

var ship1 = Ship(type: .P4, dir: .Vertical, pos: Point(x: 2, y: 2) )
var ship2 = Ship(type: .P2, dir: .Horizontal, pos: Point(x: 6, y: 7))
var field = Field(ships: ship1, ship2)

field.showField()

field.shot(shoot: Point(x: 2, y: 3))// wound
field.shot(shoot: Point(x: 3, y: 3))// pass
field.shot(shoot: Point(x: 3, y: 3))
field.shot(shoot: Point(x: 5, y: 8))// pass
field.shot(shoot: Point(x: 6, y: 7))
field.shot(shoot: Point(x: 7, y: 7))// kill

field.showField()


/*
let array = ["a", "b", "c"]

array[0]
array[1]

struct Family {
    
    var father = "Father"
    var mother = "Mother"
    var kids = ["Kid1", "Kid2", "Kid3"]
    
    var count : Int {
        return 2 + kids.count
    }
    
    subscript(index: Int) -> String? {
        
        get {
            switch index {
                
            case 0: return father
            case 1: return mother
            case 2 ..< (2 + kids.count): return kids[index - 2]
            default: return nil
            }
        }
        set {
            
            let value = newValue ?? ""
            
            switch index {
                
            case 0:  father = value
            case 1:  mother = value
            case 2 ..< (2 + kids.count):  kids[index - 2] = value
            default:  break
            }
        }
    }
    
    subscript(index: Int, suffix: String) -> String? {
        
        var name = self[index] ?? ""
        name += " " + suffix
        
        return name
    }
    
}

var family = Family()

family.father
family.mother

family.kids[0]

family.count

family[0]
family[1]
family[2]


family[0] = "Daddy"

family[0]


family[3] = "Buddy"
family.kids[1]

family[3, "the great"]!


struct Field {
    
    var dict = [String: String]()
    
    func keyForColumn(column: String, andRow row: Int) -> String {
        return column + String(row)
    }
    
    subscript(column: String, row: Int) -> String? {
        
        get {
            return dict[keyForColumn(column: column, andRow: row)]
        }
        set {
            dict[keyForColumn(column: column, andRow: row)] = newValue
        }
    }
}


var field = Field()

field["a", 5]
field["a", 5] = "X"
field["a", 6]

*/
