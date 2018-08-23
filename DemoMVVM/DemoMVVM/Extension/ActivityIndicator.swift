//
//  ActivityIndicator.swift
//  TheMoviesReal
//
//  Created by Trịnh Giang Đông on 7/24/18.
//  Copyright © 2018 Hai. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public class ActivityIndicator: SharedSequenceConvertibleType {
    public typealias E = Bool
    public typealias SharingStrategy = DriverSharingStrategy
    
    private let lock = NSRecursiveLock()
    private let variable = BehaviorRelay<Bool>(value: false)
    private let loading: SharedSequence<SharingStrategy, Bool>
    
    public init() {
        loading = variable.asDriver().distinctUntilChanged()
    }
    
    private func subscribed() {
        lock.lock()
        variable.accept(true)
        lock.unlock()
    }
    
    private func sendStopLoading() {
        lock.lock()
        variable.accept(false)
        lock.unlock()
    }
    
    fileprivate func trackActivityOfObservable<O: ObservableConvertibleType>(_ source: O) -> Observable<O.E> {
        return source.asObservable()
            .do(onNext: { _ in
                self.sendStopLoading()
            }, onError: { _ in
                self.sendStopLoading()
            }, onCompleted: {
                self.sendStopLoading()
            }, onSubscribe: subscribed)
    }
    
    public func asSharedSequence() -> SharedSequence<SharingStrategy, E> {
        return loading
    }
}

extension ObservableConvertibleType {
    public func trackActivity(_ activityIndicator: ActivityIndicator) -> Observable<E> {
        return activityIndicator.trackActivityOfObservable(self)
    }
}
