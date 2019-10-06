
import UIKit

class MainVC: UIViewController {
    
    let userMaxCount: Int = 10
    let columCount: Int = 2
    
    let lineSpace: CGFloat = 2.0
    let interitemSpace: CGFloat = 2.0
    
    @IBOutlet weak var userCollectionV: UICollectionView! {
        didSet {
            userCollectionV.delegate = self
            userCollectionV.dataSource = self
            userCollectionV.register(cellType: UserCell.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let flowLayout = UICollectionViewFlowLayout()
        let margin: CGFloat = 3.0
        flowLayout.itemSize = CGSize(width: 10.0, height: 10.0)
        flowLayout.minimumInteritemSpacing = margin
        flowLayout.minimumLineSpacing = margin
        flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        userCollectionV.setCollectionViewLayout(flowLayout, animated: true)
        userCollectionV.setNeedsLayout()
        userCollectionV.reloadData()
    }
    
}

extension MainVC: UICollectionViewDelegate {
    
}

extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userMaxCount
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
        let width  = userCollectionV.bounds.width  / CGFloat(columCount) - (margin * CGFloat(columCount+1))
        let height = userCollectionV.bounds.height / CGFloat(columCount) - (margin * CGFloat(columCount+1))
        let size = CGSize(width: width, height: height)
        return size
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return lineSpace
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interitemSpace
    }
}
