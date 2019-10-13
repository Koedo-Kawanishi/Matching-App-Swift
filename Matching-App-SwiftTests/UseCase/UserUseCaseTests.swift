//
//  UserUseCaseTests.swift
//  Matching-App-SwiftTests
//
//  Created by nancy on 2019/10/12.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import XCTest
import RxSwift
import RxBlocking
import RxTest
@testable import Matching_App_Swift

class UserUseCaseTests: XCTestCase {

    private let useCase = UserUseCase()
    private let disposeBag = DisposeBag()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// IDを指定せずに全て取得するパターン
    func testFetchUserWithFetchAllPattern() throws {
        let expectation = self.expectation(description: "Fetch all users info")
        let request = UsersRequest(id: nil)
        useCase.fetchUsers(request: request)
            .subscribe(onSuccess: { response in
                guard let user = response.users.first else {
                    XCTFail()
                    expectation.fulfill()
                    return
                }
                XCTAssertEqual(user.id, 1)
                XCTAssertEqual(user.name, "新納真次郎")
                XCTAssertEqual(user.sex, .male)
                XCTAssertEqual(user.age, 24)
                XCTAssertEqual(user.resitence, "埼玉県")
                expectation.fulfill()

            }, onError: { error in
                XCTFail(error.localizedDescription)
                expectation.fulfill()
            }).disposed(by: disposeBag)

        waitForExpectations(timeout: 10, handler: nil)
    }

    /// IDを指定し、1ユーザーの情報のみ取得するパターン
    func testFetchUserWithFetchOneUserPattern() throws {
        let expectation = self.expectation(description: "Fetch one users info")
        let request = UsersRequest(id: "1")
        useCase.fetchUsers(request: request)
            .subscribe(onSuccess: { response in
                guard let user = response.users.first else {
                    XCTFail()
                    expectation.fulfill()
                    return
                }
                XCTAssertEqual(response.users.count, 1)
                XCTAssertEqual(user.id, 1)
                XCTAssertEqual(user.name, "新納真次郎")
                XCTAssertEqual(user.sex, .male)
                XCTAssertEqual(user.age, 24)
                XCTAssertEqual(user.resitence, "埼玉県")
                expectation.fulfill()

            }, onError: { error in
                XCTFail(error.localizedDescription)
                expectation.fulfill()
            }).disposed(by: disposeBag)

        waitForExpectations(timeout: 10, handler: nil)
    }
}
