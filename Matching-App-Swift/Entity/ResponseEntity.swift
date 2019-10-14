//
//  ResponseEntity.swift
//  Matching-App-Swift
//
//  Created by nancy on 2019/10/12.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol ResponseEntity {
    init(_ json: JSON)
}
