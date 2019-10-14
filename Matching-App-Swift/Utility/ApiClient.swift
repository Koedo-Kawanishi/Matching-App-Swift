//
//  ApiClient.swift
//  Matching-App-Swift
//
//  Created by nancy on 2019/10/12.
//  Copyright © 2019 新納真次郎. All rights reserved.
//

import Alamofire
import RxSwift
import SwiftyJSON

protocol ApiClientProtocol {
    var baseUrl: String { get }
    init(_ baseUrl: String)

    func get<T: ResponseEntity>(path: String?,
                                version: String,
                                request: RequestEntity?) -> Single<T>
    func post<T: ResponseEntity>(path: String?,
                                 version: String,
                                 request: RequestEntity?) -> Single<T>
}

final class ApiClient: ApiClientProtocol {
    var baseUrl: String

    init(_ baseUrl: String) {
        self.baseUrl = baseUrl
    }

    func get<T: ResponseEntity>(path: String?,
                                version: String = API_VER,
                                request: RequestEntity?) -> Single<T> {
        var requestUrl = baseUrl + version
        if let path = path {
            requestUrl += path
        }

        if let request = request, !request.parameterize().isEmpty {
            let params = setGetParameters(request.parameterize())
            requestUrl += params
        }

        return Single<T>.create(subscribe: { single in
            let manager = Session.default
            let request = manager.request(requestUrl,
                                          method: .get,
                                          parameters: nil,
                                          encoding: JSONEncoding.default,
                                          headers: nil)
                .responseJSON(completionHandler: { response in
                    switch response.result {
                    case .success(_):
                        guard let data = response.data else {
                            return single(.error(response.error!))
                        }
                        let json = JSON(data)
                        return single(.success(T(json)))

                    case .failure(let error):
                        return single(.error(error))
                    }
                })
            return Disposables.create {
                return request.cancel()
            }
        })
    }

    func post<T: ResponseEntity>(path: String?,
                                 version: String = API_VER,
                                 request: RequestEntity?) -> Single<T> {
        var requestUrl = baseUrl + version
        if let path = path {
            requestUrl += path
        }

        var params = Parameters()
        if let request = request {
            params = request.parameterize()
        }

        return Single<T>.create(subscribe: { single in
            let manager = Session.default
            let request = manager.request(requestUrl,
                                          method: .post,
                                          parameters: params,
                                          encoding: JSONEncoding.default,
                                          headers: nil)
                .responseJSON(completionHandler: { response in
                    switch response.result {
                    case .success(_):
                        guard let data = response.data else {
                            return single(.error(response.error!))
                        }
                        let json = JSON(data)
                        return single(.success(T(json)))

                    case .failure(let error):
                        return single(.error(error))
                    }
                })
            return Disposables.create {
                return request.cancel()
            }
        })
    }


    /// Swift5 〜の仕様変更で、GET リクエスト時に body にパラメータを入れるとエラーになってしまうため、文字列に変換する
    /// - Parameter dict: [String: Any] 型で渡す.  !isEmpty の場合のみ実行すること
    private func setGetParameters(_ dict: [String: Any]) -> String {
        var params = "?"
        for (key, value) in dict {
            params += "\(key)=\(value)&"
        }
        return params
    }
}
