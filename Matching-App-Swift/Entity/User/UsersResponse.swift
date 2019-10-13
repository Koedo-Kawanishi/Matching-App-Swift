//
//  UsersResponse.swift
//  Matching-App-Swift
//
//  Created by nancy on 2019/10/12.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import SwiftyJSON

struct UsersResponse: ResponseEntity {

    var users: [User]

    init(_ json: JSON) {
        let array = json["results"].arrayValue
        self.users = array.map({ data -> User in
            return User(id: data["id"].intValue,
                        name: data["name"].stringValue,
                        sex: Sex(data["sex"].stringValue),
                        age: data["age"].intValue,
                        resitence: data["residence"].stringValue)
        })
    }
}
