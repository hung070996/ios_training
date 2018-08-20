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
    var register = Register()
    
    var isValid: Observable<Bool> {
        return Observable.combineLatest(register.password.asObservable(), register.confirm.asObservable()) { pass, confirm in
            pass == confirm && !(pass.isEmpty || confirm.isEmpty || self.register.username.value.isEmpty)
        }
    }
}
