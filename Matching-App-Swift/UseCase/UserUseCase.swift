//
//  UserUseCase.swift
//  Matching-App-Swift
//
//  Created by 新納真次郎 on 2019/10/11.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import Foundation
import RxSwift

final class UserUseCase {

    let apiClient = ApiClient(API_BASE_URL)

    func fetchUsers(request: UsersRequest?) -> Single<UsersResponse> {
        return apiClient.get(path: API_USERS_PATH, request: request)
    }
}
