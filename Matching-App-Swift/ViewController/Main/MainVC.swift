
import UIKit

class MainVC: UIViewController {
    
    @IBOutlet weak var userCollectionV: UICollectionView! {
        didSet {
            userCollectionV.delegate = self
            userCollectionV.dataSource = self
            userCollectionV.register(cellType: UserCell.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userCollectionV.reloadData()
    }
    
}

extension MainVC: UICollectionViewDelegate {
    
}

extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: UserCell.self, for: indexPath)
        return cell
    }
}

extension MainVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let margin: CGFloat = 1.0
        let width = userCollectionV.bounds.width / 2 - margin * 2.0
        let height = userCollectionV.bounds.height / 2 - margin * 2.0
        let size = CGSize(width: width, height: height)
        return size
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
