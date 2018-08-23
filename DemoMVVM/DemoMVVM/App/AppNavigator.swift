//
//  AppNavigator.swift
//  DemoMVVM
//
//  Created by Do Hung on 8/22/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import Foundation
import UIKit
import Reusable

protocol AppNavigatorType {
    func toMain()
}

struct AppNavigator: AppNavigatorType {
    unowned let window: UIWindow
    
    func toMain() {
        let viewController = ViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: viewController)
        let navigator = MainNavigator(navigationController: navigationController)
        let useCase = GenreUseCase()
        let viewModel = GenreViewModel(useCase: useCase, navigator: navigator)
        viewController.bindViewModel(to: viewModel)
        window.rootViewController = navigationController
    }
}
