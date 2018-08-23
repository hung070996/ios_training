//
//  DetailUsecase.swift
//  DemoMVVM
//
//  Created by Do Hung on 8/22/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol DetailUseCaseType {
    func getDetailTrack(track: Track) -> Observable<Track>
}

struct DetailUseCase: DetailUseCaseType {
    func getDetailTrack(track: Track) -> Observable<Track> {
        let repository = DetailRepositoryImp()
        return repository.getDetail(input: track)
    }
}
