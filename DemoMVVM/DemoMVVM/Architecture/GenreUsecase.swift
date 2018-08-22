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
    func getListTrack() -> Observable<[Track]>
}

struct GenreUseCase: GenreUseCaseType {
    func getListTrack() -> Observable<[Track]> {
        let request = GenreRequest()
        let repository = GenreRepositoryImp(api: APIManager.shared)
        return repository.getGenre(input: request)
    }
}
