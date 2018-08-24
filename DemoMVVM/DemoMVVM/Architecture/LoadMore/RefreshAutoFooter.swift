//
//  RefreshAutoFooter.swift
//  TheMoviesReal
//
//  Created by Do Hung on 8/22/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import Foundation
import UIKit
import MJRefresh

class RefreshAutoFooter: MJRefreshAutoFooter {
    private var _loadingView: UIActivityIndicatorView?
    
    var activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white {
        didSet {
            _loadingView = nil
            setNeedsLayout()
        }
    }
    
    var loadingView: UIActivityIndicatorView {
        if _loadingView == nil {
            let view = UIActivityIndicatorView(activityIndicatorStyle: self.activityIndicatorViewStyle)
            view.hidesWhenStopped = true
            view.color = .orange
            self.addSubview(view)
            _loadingView = view
        }
        return _loadingView!
    }
    
    override func prepare() {
        super.prepare()
        activityIndicatorViewStyle = .white
    }
    
    override func placeSubviews() {
        super.placeSubviews()
        let center = CGPoint(x: mj_w * 0.5, y: mj_h * 0.5)
        if loadingView.constraints.count == 0 {
            loadingView.center = center
        }
    }
    
    override var state: MJRefreshState {
        didSet {
            switch state {
            case .idle:
                if oldValue == .refreshing {
                    UIView.animate(withDuration: TimeInterval(MJRefreshSlowAnimationDuration), animations: {
                        self.loadingView.alpha = 0
                    }) { (finished) in
                        self.loadingView.alpha = 1
                        self.loadingView.stopAnimating()
                    }
                } else {
                    loadingView.stopAnimating()
                }
            case .pulling:
                loadingView.stopAnimating()
            case .refreshing:
                loadingView.startAnimating()
            case .noMoreData:
                loadingView.stopAnimating()
            default:
                break
            }
        }
    }
}
