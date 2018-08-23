//
//  DetailViewModal.swift
//  DemoMVVM
//
//  Created by Do Hung on 8/22/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct DetailViewModel: ViewModelType {
    
    struct Input {
        let loadTrigger: Driver<Void>
    }
    
    struct Output {
        let nameTrack: Driver<String>
        let genreTrack: Driver<String>
    }
    
    let useCase: DetailUseCaseType
    let navigator: DetailNavigator
    let track: Track
    
    func transform(_ input: DetailViewModel.Input) -> DetailViewModel.Output {
        let nameTrack = input.loadTrigger
            .map { track in
                return self.track.title
            }
        let genreTrack = input.loadTrigger
            .map { track in
                return self.track.genre
            }
        
        return Output(
            nameTrack: nameTrack,
            genreTrack: genreTrack
        )
    }
}
