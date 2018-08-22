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

class ViewController: UIViewController, BindableType {
    
    @IBOutlet private var tableView: UITableView!
    
    var viewModel: GenreViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        bindViewModel()
    }
    
    func configView() {
        viewModel = GenreViewModel(useCase: GenreUseCase())
    }
    
    func bindViewModel() {
        let input = GenreViewModel.Input(
            loadTrigger: Driver.just(())
            )
        
        let output = viewModel.transform(input)
        output.trackList
            .drive(tableView.rx.items) { tableView, index, element in
                let cell: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "1")
                cell.textLabel?.text = element.title
                return cell
            }
            .disposed(by: rx.disposeBag)
        output.error
            .drive(rx.error)
            .disposed(by: rx.disposeBag)
        output.indicator
            .drive(rx.isLoading)
            .disposed(by: rx.disposeBag)
    }
}

