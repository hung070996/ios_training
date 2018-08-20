//
//  ViewController.swift
//  RegisterMVVM
//
//  Created by Do Hung on 8/19/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet var registerButton: UIButton!
    @IBOutlet var confirmTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet var usernameTextfield: UITextField!
    
    var registerViewModal = RegisterViewModal()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = usernameTextfield.rx.text.map { $0 ?? "" }
            .bind(to: registerViewModal.usernameText)
        _ = passwordTextfield.rx.text.map { $0 ?? "" }
            .bind(to: registerViewModal.passwordText)
        _ = confirmTextfield.rx.text.map { $0 ?? "" }
            .bind(to: registerViewModal.confirmText)
        _ = registerViewModal.isValid.subscribe(onNext: { [unowned self] isValid in
            self.setEnableButtonRegister(isEnable: isValid)
        })
    }
    
    func setEnableButtonRegister(isEnable: Bool) {
        guard let textUsername = confirmTextfield.text, let textPass = passwordTextfield.text, let textConfirm = confirmTextfield.text else {
            return
        }
        if !isEnable || textUsername.isEmpty || textPass.isEmpty || textConfirm.isEmpty {
            registerButton.isEnabled = false
            registerButton.backgroundColor = .gray
        } else {
            registerButton.isEnabled = true
            registerButton.backgroundColor = .green
        }
    }
}

