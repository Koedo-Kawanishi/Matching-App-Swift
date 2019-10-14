//
//  Constants.swift
//  Matching-App-Swift
//
//  Created by nancy on 2019/10/12.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import Foundation

#if DEBUG

let API_BASE_URL = "https://nino.nkmr.io/matching-app-swift/api/"

#else

let API_BASE_URL = "https://nino.nkmr.io/matching-app-swift/api/"

#endif

let API_VER = "v1"

// MARK: - Path
let API_USERS_PATH = "/users.php"
let API_MESSAGES_PATH = "/messages.php"
let API_FACES_PATH = "/faces.php"
