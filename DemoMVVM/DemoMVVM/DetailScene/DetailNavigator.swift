//
//  DetailNavigator.swift
//  DemoMVVM
//
//  Created by Do Hung on 8/22/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import Foundation
import UIKit

protocol DetailNavigatorType {
    func toDetailScreen(track: Track)
}

struct DetailNavigator: DetailNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func toDetailScreen(track: Track) {
        let detailViewController = DetailViewController.instantiate()
        let detailViewModel = DetailViewModel(useCase: DetailUseCase(), navigator: self, track: track)
        detailViewController.bindViewModel(to: detailViewModel)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
