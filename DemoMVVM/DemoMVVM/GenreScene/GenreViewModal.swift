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
        let reloadTrigger: Driver<Void>
        let loadMoreTrigger: Driver<Void>
    }
    
    struct Output {
        let trackList: Driver<[TrackModel]>
        let error: Driver<Error>
        let indicator: Driver<Bool>
        let selectedTrack: Driver<Void>
        let refreshing: Driver<Bool>
        let loadingMore: Driver<Bool>
        let fetchItems: Driver<Void>
    }
    
    struct TrackModel {
        let track: Track
    }

    let useCase: GenreUseCaseType
    let navigator: MainNavigator
    
    func transform(_ input: GenreViewModel.Input) -> GenreViewModel.Output {
        let loadMoreOutput = setupLoadMorePaging(
            loadTrigger: input.loadTrigger,
            getItems: useCase.getListTrack,
            refreshTrigger: input.reloadTrigger,
            refreshItems: useCase.getListTrack,
            loadMoreTrigger: input.loadMoreTrigger,
            loadMoreItems: useCase.loadMoreListTrack)
        let (page, fetchItems, loadError, loading, refreshing, loadingMore) = loadMoreOutput
        
        let trackList = page
            .map { $0.items
                .map { TrackModel(track: $0) } }
            .asDriverOnErrorJustComplete()
        
        let selectedTrack = input.selectTrackTrigger
            .withLatestFrom(trackList) { indexPath, trackList in
                return (indexPath, trackList)
            }
            .map { (indexPath, trackList) in
                return trackList[indexPath.row]
            }
            .do(onNext: { track in
                self.navigator.toDetail(track: track.track)
            })
            .mapToVoid()

        return Output(
            trackList: trackList,
            error: loadError,
            indicator: loading,
            selectedTrack: selectedTrack,
            refreshing: refreshing,
            loadingMore: loadingMore,
            fetchItems: fetchItems
        )
    }
}
