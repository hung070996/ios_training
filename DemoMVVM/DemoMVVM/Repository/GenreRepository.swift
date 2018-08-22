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

protocol GenreRepository {
    func getGenre(input: GenreRequest) -> Observable<[Track]>
}

class GenreRepositoryImp: GenreRepository {
    func getGenre(input: GenreRequest) -> Observable<[Track]> {
        return api.request(input: input).map({ (response: Genre) -> [Track] in
            return response.collection
        })
    }
    
    private var api: APIManager!
    
    required init(api: APIManager) {
        self.api = api
    }
}
