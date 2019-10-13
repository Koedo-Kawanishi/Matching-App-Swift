
import UIKit

class UserCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!

    override func awakeFromNib() {
           super.awakeFromNib()
    }

    func setData(user: User) {
        nameLabel.text = user.name
        nameLabel.text = String(user.age)
    }
}
