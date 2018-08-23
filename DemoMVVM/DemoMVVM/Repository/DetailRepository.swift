//
//  DetailRepository.swift
//  DemoMVVM
//
//  Created by Do Hung on 8/22/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import Foundation
import ObjectMapper
import RxSwift

protocol DetailRepository {
    func getDetail(input: Track) -> Observable<Track>
}

class DetailRepositoryImp: DetailRepository {
    func getDetail(input: Track) -> Observable<Track> {
        return Observable.create{ (subcriber) -> Disposable in
            subcriber.onNext(input)
            return Disposables.create()
        }
    }
    
    required init() { }
}
