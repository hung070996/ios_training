//
//  RegisterViewModal.swift
//  DemoMVVM
//
//  Created by Do Hung on 8/20/18.
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
        return Observable.combineLatest(passwordText.asObservable(), confirmText.asObservable()) { pass, confirm in
            pass == confirm && !(pass.isEmpty || confirm.isEmpty || self.usernameText.value.isEmpty)
        }
    }
}
