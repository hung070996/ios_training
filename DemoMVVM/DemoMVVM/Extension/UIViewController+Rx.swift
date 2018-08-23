//
//  UIViewController+Rx.swift
//  TheMoviesReal
//
//  Created by Trịnh Giang Đông on 7/24/18.
//  Copyright © 2018 Hai. All rights reserved.
//

import Foundation
import MBProgressHUD
import RxSwift
import RxCocoa
import MKProgress

extension Reactive where Base: UIViewController {
    var error: Binder<Error> {
        return Binder(base) { viewController, error in
            viewController.showAlertError(message: error.localizedDescription)
        }
    }
    
    var isLoading: Binder<Bool> {
        return Binder(base) { viewController, isLoading in
            if isLoading {
                MKProgress.config.hudType = .radial
                MKProgress.config.hudColor = UIColor(red: 22 / 255.0, green: 20 / 255.0, blue: 21 / 255.0, alpha: 1.0)
                MKProgress.config.circleBorderColor = .orange
                MKProgress.show()
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
                    MKProgress.hide()
                }
            }
        }
    }
    
    var searchLoading: Binder<Bool> {
        return Binder(base) { viewController, isLoading in
            if isLoading {
                let hud = MBProgressHUD.showAdded(to: viewController.view, animated: true)
                hud.contentColor = UIColor.orange
                hud.offset.y = -30
            } else {
                MBProgressHUD.hide(for: viewController.view, animated: true)
            }
        }
    }
    
    var screenTitle: Binder<String> {
        return Binder(base) { viewController, screenTitle in
            viewController.navigationItem.title = screenTitle
        }
    }
}
