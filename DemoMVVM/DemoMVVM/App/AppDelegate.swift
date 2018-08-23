//
//  AppDelegate.swift
//  DemoMVVM
//
//  Created by Do Hung on 8/20/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        bindViewModel()
        return true
    }

    private func bindViewModel() {
        guard let window = window else { return }
        let navigator = AppNavigator(window: window)
        let appUseCase = AppUseCase()
        let appViewModel = AppViewModel(navigator: navigator, useCase: appUseCase)
        let input = AppViewModel.Input(loadTrigger: Driver.just(()))
        let output = appViewModel.transform(input)
        output.toMain.drive().disposed(by: rx.disposeBag)
    }
}

