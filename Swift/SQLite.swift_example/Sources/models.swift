import Foundation

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
    var birthDate = Date()

    public var description: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = formatter.string(from: birthDate)
        return "{ Person: { Id: \(id), name: \(name), Address: \(address), BirthDate: \(formattedDate) } }"
    }
}

enum Position: String {
    case staffer = "Staffer"
    case manager = "Manager"
    case boss    = "Boss"
}

struct Employee {
    var id = ""
    var department: Department? = nil
    var person: Person? = nil
    var position: Position? = nil

    public var description: String {
        return "{ Employee: { Id: \(id), Person: \(person?.description ?? ""), Department: \(department?.description ?? ""), Position: \(position?.rawValue ?? "") } }"
    }
}
