
import Foundation

enum Sex: String, Codable {
    case male, female, other

    init(_ sex: String) {
        switch sex {
        case "man", "male":
            self = .male
        case "woman", "female":
            self = .female
        default:
            self = .other
        }
    }
}

struct User: Codable {
    let id: Int
    let name: String
    let sex: Sex
    let age: Int
    let resitence: String
}
