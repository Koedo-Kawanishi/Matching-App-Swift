//
//  RequestEntity.swift
//  Matching-App-Swift
//
//  Created by nancy on 2019/10/12.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import Foundation

protocol RequestEntity {
    func parameterize() -> [String: Any]
}
