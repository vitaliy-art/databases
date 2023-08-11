struct Department {
    var id = 0
    var name = ""

    public var description: String {
        return "{ Department: { Id: \(id), Name: \(name) } }"
    }
}

struct Person {
    var id = ""
    var name = ""
    var address = ""
    var birthDate = ""

    public var description: String {
        return "{ Person: { Id: \(id), name: \(name), Address: \(address), BirthDate: \(birthDate) } }"
    }
}

enum Position {
    case staffer, manager, boss
}

struct Employee {
    var id = ""
    var department: Department? = nil
    var person: Person? = nil
    var position: Position? = nil

    public var description: String {
        return "{ Employee: { Id: \(id), Person: \(String(describing: person)), Department: \(String(describing: department)), Position: \(String(describing: position)) } }"
    }
}
