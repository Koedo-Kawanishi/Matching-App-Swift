//
//  UIViewController+Extention.swift
//  Matching-App-Swift
//
//  Created by nancy on 2019/10/11.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import UIKit

extension UIViewController {


    /// ViewController のインスタンスを生成するメソッド.
    /// Storyboard 名と ViewController 名が一致している必要あり
    func instanceFromStoryboard<T: UIViewController>() -> T? {
        let name = String(describing: T.self)
        let bundle = Bundle(for: T.self)
        
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        return storyboard.instantiateInitialViewController() as? T
    }
}
