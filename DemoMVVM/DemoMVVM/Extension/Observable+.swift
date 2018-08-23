//
//  Observable+.swift
//  TheMoviesReal
//
//  Created by Trịnh Giang Đông on 7/24/18.
//  Copyright © 2018 Hai. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

extension ObservableType where E == Bool {
    public func not() -> Observable<Bool> {
        return self.map(!)
    }
}

extension ObservableType {
    public func unwrap<T>() -> Observable<T> where E == T? {
        return self.filter { value in
            if case .some = value {
                return true
            }
            return false
            }.map{ $0! }
    }
    
    func catchErrorJustComplete() -> Observable<E> {
        return catchError { _ in
            return Observable.empty()
        }
    }
    
    func asDriverOnErrorJustComplete() -> Driver<E> {
        return asDriver { _ in
            return Driver.empty()
        }
    }
    
    func mapToVoid() -> Observable<Void> {
        return map { _ in }
    }
    
    func mapToOptional() -> Observable<E?> {
        return map { value -> E? in
            value
        }
    }
}

extension SharedSequenceConvertibleType {
    func mapToVoid() -> SharedSequence<SharingStrategy, Void> {
        return map { _ in }
    }
    
    func mapToOptional() -> SharedSequence<SharingStrategy, E?> {
        return map { value -> E? in
            value
        }
    }
    
    public func unwrap<T>() -> SharedSequence<SharingStrategy, T> where E == T? {
        return self
            .filter { value in
                if case .some = value {
                    return true
                }
                return false
            }.map { $0! }
    }
}
