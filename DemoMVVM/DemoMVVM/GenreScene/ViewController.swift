//
//  ViewController.swift
//  DemoMVVM
//
//  Created by Do Hung on 8/20/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import NSObject_Rx
import Reusable

class ViewController: UIViewController, BindableType {
    
    @IBOutlet private var tableView: RefreshTableView!
    
    var viewModel: GenreViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func bindViewModel() {
        let input = GenreViewModel.Input(
            loadTrigger: Driver.just(()),
            selectTrackTrigger: tableView.rx.itemSelected.asDriver(),
            reloadTrigger: tableView.loadMoreTopTrigger,
            loadMoreTrigger: tableView.loadMoreBottomTrigger
            )
        
        let output = viewModel.transform(input)
        output.trackList
            .drive(tableView.rx.items) { tableView, index, element in
                let cell: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "1")
                cell.textLabel?.text = element.track.title
                return cell
            }
            .disposed(by: rx.disposeBag)
        output.selectedTrack
            .drive()
            .disposed(by: rx.disposeBag)
        output.error
            .drive(rx.error)
            .disposed(by: rx.disposeBag)
        output.indicator
            .drive(rx.isLoading)
            .disposed(by: rx.disposeBag)
        output.refreshing
            .drive(tableView.loadingMoreTop)
            .disposed(by: rx.disposeBag)
        output.loadingMore
            .drive(tableView.loadingMoreBottom)
            .disposed(by: rx.disposeBag)
        output.fetchItems
            .drive()
            .disposed(by: rx.disposeBag)
    }
}

extension ViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}

