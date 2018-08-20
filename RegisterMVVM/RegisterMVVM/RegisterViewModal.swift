//
//  RegisterViewModal.swift
//  RegisterMVVM
//
//  Created by Do Hung on 8/19/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct RegisterViewModal {
    var usernameText = Variable("")
    var passwordText = Variable("")
    var confirmText = Variable("")
    
    var isValid: Observable<Bool> {
//        if usernameText.value.isEmpty || passwordText.value.isEmpty || confirmText.value.isEmpty {
//            return false
//        } else {
            return Observable.combineLatest(passwordText.asObservable(), confirmText.asObservable()) { pass, confirm in
                return pass == confirm
//            }
        }
    }
}
