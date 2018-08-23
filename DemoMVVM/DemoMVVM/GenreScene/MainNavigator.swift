//
//  MainNavigator.swift
//  DemoMVVM
//
//  Created by Do Hung on 8/22/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import Foundation
import UIKit

protocol MainNavigatorType {
    func toDetail(track: Track)
}

struct MainNavigator: MainNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func toDetail(track: Track) {
        let navigator = DetailNavigator(navigationController: navigationController)
        navigator.toDetailScreen(track: track)
    }

}
