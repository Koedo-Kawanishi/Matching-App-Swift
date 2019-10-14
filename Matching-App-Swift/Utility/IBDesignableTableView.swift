import UIKit

// 右カラムのAttributes Inspectorで設定した値がリアルタイムで適用される
// classの前のここに書く
@IBDesignable

class IBDesignableTableView: UITableView {

    // 今回はボタンの枠線の色，太さ，ボタンの角を丸める設定をいじってみる
    // 以下の変数宣言でこれらがデフォルトの値になる
    @IBInspectable var borderColor = UIColor.clear
    @IBInspectable var borderWidth: CGFloat = 1.0
    @IBInspectable var cornerRadius: CGFloat = 5.0
    @IBInspectable var shadowOffset = CGSize(width: 0.0, height: 2.0)
    @IBInspectable var shadowColor = UIColor.black
    @IBInspectable var shadowOpacity: CGFloat = 0.7
    @IBInspectable var maskToBounds: Bool = true

    // Attributes Inspectorで設定した値を反映
    override func draw(_ rect: CGRect) {
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOpacity = Float(shadowOpacity)
        self.layer.masksToBounds = maskToBounds
    }
}
