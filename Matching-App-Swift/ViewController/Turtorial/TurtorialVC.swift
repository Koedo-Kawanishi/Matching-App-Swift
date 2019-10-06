
import UIKit
import RxSwift

class TurtorialPageVC: UIPageViewController {
    
    //PageControlの生成
    var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setViewControllers([getFirst()], direction: .forward, animated: true, completion: nil)
        self.dataSource = self
        preparePageControl() // FIXME: なぜか1→3に急に飛ぶ
    }
    
    func preparePageControl(){
        pageControl = UIPageControl(frame: CGRect(x:0, y:self.view.frame.height - 100, width:self.view.frame.width, height:50))
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.isUserInteractionEnabled = false
        self.view.addSubview(pageControl)
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
        let thirdVC = storyboard.instantiateViewController(withIdentifier: "TurtorialThirdVC") as? TurtorialThirdVC else {
            return nil
        }
        
        return thirdVC
    }

}

extension TurtorialPageVC: UIPageViewControllerDataSource {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let index = viewController.view.tag
        pageControl.currentPage = index
        
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
        let index = viewController.view.tag
        pageControl.currentPage = index
        
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

