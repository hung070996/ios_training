//
//  GenreUsecase.swift
//  DemoMVVM
//
//  Created by Do Hung on 8/22/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol GenreUseCaseType {
    func getListTrack() -> Observable<PagingInfo<Track>>
    func loadMoreListTrack(page: Int) -> Observable<PagingInfo<Track>>
}

struct GenreUseCase: GenreUseCaseType {
    
    let repository: GenreRepository
    
    func getListTrack() -> Observable<PagingInfo<Track>> {
        return loadMoreListTrack(page: 1)
    }
    
    func loadMoreListTrack(page: Int) -> Observable<PagingInfo<Track>> {
        return repository.getGenre(input: GenreRequest(), page: page)
    }
}
