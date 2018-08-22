//
//  SearchRepository.swift
//  DemoMVVM
//
//  Created by Do Hung on 8/22/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import Foundation
import ObjectMapper
import RxSwift

protocol SearchRepository {
    func getSearch(input: SearchRequest) -> Observable<[TrackSearch]>
}

class SearchRepositoryImp: SearchRepository {
    func getSearch(input: SearchRequest) -> Observable<[TrackSearch]> {
        return api.request(input: input).map({ (response: SearchResponse) -> [TrackSearch] in
            return response.collection
        })
    }
    
    private var api: APIManager!
    
    required init(api: APIManager) {
        self.api = api
    }
}
