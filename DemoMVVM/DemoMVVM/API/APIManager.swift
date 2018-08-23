//
//  APIManager.swift
//  SoundCloud
//
//  Created by Can Khac Nguyen on 7/25/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import Foundation
import Alamofire
import ObjectMapper
import RxSwift

final class APIManager {
    static let shared = APIManager()
    private var alamofireManager = Alamofire.SessionManager.default
    
    private init() {}
    
    func request<T: Mappable>(input: BaseRequest) -> Observable<T> {
        var router = GeneralAPIRouter.getSearch(request: input)
        switch input {
        case is SearchRequest:
            router = GeneralAPIRouter.getSearch(request: input)
        case is GenreRequest:
            router = GeneralAPIRouter.getGenre(request: input)
        default:
            break
        }
        return Observable.create({ observer in
            self.alamofireManager.request(router).validate(statusCode: 200..<500)
                .responseJSON { (response) in
                    switch response.result {
                    case .success(let value):
                        guard let statusCode = response.response?.statusCode else {
                            observer.onError(BaseError.unexpectedError)
                            return
                        }
                        if statusCode == 200 {
                            let object = Mapper<T>().map(JSONObject: value)
                            observer.onNext(object!)
                        } else {
                            guard let error = Mapper<ErrorResponse>().map(JSONObject: value) else {
                                observer.onError(BaseError.httpError(httpCode: statusCode))
                                return
                            }
                            observer.onError(BaseError.apiFailure(error: error))
                        }
                    case .failure(let error):
                        observer.onError((error as? BaseError)!)
                    }
            }
            return Disposables.create()
        })
        
    }
}
