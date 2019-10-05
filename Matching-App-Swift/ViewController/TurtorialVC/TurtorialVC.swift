
import UIKit
import RxSwift

class TurtorialPageVC: UIPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
    }
    
    func getFirst() -> TurtorialFirstVC! {
        guard let storyboard = storyboard,
        let firstVC = storyboard.instantiateViewController(withIdentifier: "TurtorialFirstVC") as? TurtorialFirstVC else {
            return nil
        }
        
        return firstVC
    }
    
    func getSecond() -> TurtorialSecondVC! {
        guard let storyboard = storyboard,
        let secondVC = storyboard.instantiateViewController(withIdentifier: "TurtorialSecondVC") as? TurtorialSecondVC else {
            return nil
        }
        
        return secondVC
    }
    
    func getThird() -> TurtorialThirdVC! {
        guard let storyboard = storyboard,
        let secondVC = storyboard.instantiateViewController(withIdentifier: "TurtorialThirdVC") as? TurtorialThirdVC else {
            return nil
        }
        
        return secondVC
    }

}

extension TurtorialPageVC: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: TurtorialThirdVC.self) {
            // 3 -> 2
            return getSecond()
        } else if viewController.isKind(of: TurtorialSecondVC.self) {
            // 2 -> 1
            return getFirst()
        } else {
            // 1 -> end of the road
            return nil
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if viewController.isKind(of: TurtorialFirstVC.self) {
            // 1 -> 2
            return getSecond()
        } else if viewController.isKind(of: TurtorialSecondVC.self) {
            // 2 -> 3
            return getThird()
        } else {
            // 3 -> end of the road
            return nil
        }
    }
}

