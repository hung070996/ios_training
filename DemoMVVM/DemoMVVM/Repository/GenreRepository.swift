//
//  GenreRepository.swift
//  DemoMVVM
//
//  Created by Do Hung on 8/22/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import Foundation
import ObjectMapper
import RxSwift
import OrderedSet

protocol GenreRepository {
    func getGenre(input: GenreRequest, page: Int) -> Observable<PagingInfo<Track>>
}

class GenreRepositoryImp: GenreRepository {
    func getGenre(input: GenreRequest, page: Int) -> Observable<PagingInfo<Track>> {
        input.setLimit(limit: page * 20)
        return api.request(input: input).map({ (response: Genre) -> PagingInfo<Track> in
            return PagingInfo<Track>(page: page, items: OrderedSet<Track>(sequence: response.collection))
        })
    }
    
    private var api: APIManager!
    
    required init(api: APIManager) {
        self.api = api
    }
}
