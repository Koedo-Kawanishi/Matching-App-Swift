
import UIKit
import Lottie

class TurtorialSecondVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimation()
    }

    func showAnimation() {
           let animationView = AnimationView(name: "FaceAnimation")
           animationView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
           animationView.center = self.view.center
           animationView.loopMode = .loop
           animationView.contentMode = .scaleAspectFit
           animationView.animationSpeed = 1

           view.addSubview(animationView)
           animationView.play() // FIXME: なぜかアニメーションが発火しない
       }
}
