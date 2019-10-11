
import Foundation

struct Message: Codable {
    let id: Int
    let from_user_id: Int
    let to_user_id: Int
    let text: String
}
