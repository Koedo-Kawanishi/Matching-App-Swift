//
//  UsersRequest.swift
//  Matching-App-Swift
//
//  Created by nancy on 2019/10/12.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import Foundation

struct UsersRequest: RequestEntity {

    var id: String?

    init(id: String?) {
        self.id = id
    }

    func parameterize() -> [String : Any] {
        var dict = [String: Any]()
        if let id = id {
            dict["id"] = id
        }
        return dict
    }
}
