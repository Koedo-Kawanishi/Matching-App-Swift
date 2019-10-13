
import UIKit
import RxSwift
import RxCocoa

class MainVC: UIViewController {

    private let userMaxCount: Int = 10
    private let columCount: Int = 2

    private let lineSpace: CGFloat = 2.0
    private let interitemSpace: CGFloat = 2.0

    private let viewModel = MainViewModel()
    private let disposeBag = DisposeBag()

    private var usersList = [User]()

    @IBOutlet weak var userCollectionView: UICollectionView! {
        didSet {
            userCollectionView.delegate = self
            userCollectionView.dataSource = self
            userCollectionView.register(cellType: UserCell.self)
            let flowLayout = UICollectionViewFlowLayout()
            let margin: CGFloat = 3.0
            flowLayout.itemSize = CGSize(width: 10.0, height: 10.0)
            flowLayout.minimumInteritemSpacing = margin
            flowLayout.minimumLineSpacing = margin
            flowLayout.sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
            userCollectionView.setCollectionViewLayout(flowLayout, animated: true)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        fetchUsers()
    }


    private func fetchUsers() {
        viewModel.fetchUser(sex: .female)
            .asDriver(onErrorRecover: { error in
                return Driver.empty()
            }).drive(onNext: { [weak self] response in
                self?.usersList.append(contentsOf: response)
                self?.userCollectionView.reloadData()
            }).disposed(by: disposeBag)
    }

    private func setupCollectionView() {
        userCollectionView.setNeedsLayout()
        userCollectionView.reloadData()
    }
}

extension MainVC: UICollectionViewDelegate {

}

extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return usersList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: UserCell.self, for: indexPath)
        cell.setData(user: usersList[indexPath.row])
        return cell
    }
}

extension MainVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let margin: CGFloat = 1.0
        let width  = userCollectionView.bounds.width  / CGFloat(columCount) - (margin * CGFloat(columCount+1))
        let height = userCollectionView.bounds.height / CGFloat(columCount) - (margin * CGFloat(columCount+1))
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
