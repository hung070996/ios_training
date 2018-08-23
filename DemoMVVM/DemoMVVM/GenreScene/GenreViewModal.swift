//
//  GenreViewModal.swift
//  DemoMVVM
//
//  Created by Do Hung on 8/22/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct GenreViewModel: ViewModelType {
    struct Input {
        let loadTrigger: Driver<Void>
        let selectTrackTrigger: Driver<IndexPath>
    }
    
    struct Output {
        let trackList: Driver<[Track]>
        let error: Driver<Error>
        let indicator: Driver<Bool>
        let selectedTrack: Driver<Void>
    }
    
    let useCase: GenreUseCaseType
    let navigator: MainNavigator
    
    func transform(_ input: GenreViewModel.Input) -> GenreViewModel.Output {
        let errorTracker = ErrorTracker()
        let activityIndicator = ActivityIndicator()
        let trackList = input.loadTrigger
            .flatMapLatest { _ in
                return self.useCase.getListTrack()
                    .trackError(errorTracker)
                    .trackActivity(activityIndicator)
                    .asDriverOnErrorJustComplete()
        }
        let selectedTrack = input.selectTrackTrigger
            .withLatestFrom(trackList) { indexPath, trackList in
                return (indexPath, trackList)
            }
            .map { (indexPath, trackList) in
                return trackList[indexPath.row]
            }
            .do(onNext: { track in
                self.navigator.toDetail(track: track)
            })
            .mapToVoid()

        
        return Output(
            trackList: trackList,
            error: errorTracker.asDriver(),
            indicator: activityIndicator.asDriver(),
            selectedTrack: selectedTrack
        )
    }
}
