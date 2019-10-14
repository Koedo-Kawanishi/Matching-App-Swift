//
//  MainViewModel.swift
//  Matching-App-Swift
//
//  Created by nancy on 2019/10/13.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import Foundation
import RxSwift

final class MainViewModel {

    private let userUseCase = UserUseCase()

    func fetchUser(sex: Sex) -> Single<[User]> {
        // TODO: ここで UsersRequestEntity のインスタンスを作成
        // TODO: 性別によって取得してくるユーザを分ける
        return userUseCase.fetchUsers(request: nil).flatMap({ (response: UsersResponse) in
            return Single.just(response.users)
        })
    }
}
