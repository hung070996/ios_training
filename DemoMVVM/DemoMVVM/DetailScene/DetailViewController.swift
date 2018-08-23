//
//  DetailViewController.swift
//  DemoMVVM
//
//  Created by Do Hung on 8/22/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit
import Reusable
import RxCocoa
import RxSwift

class DetailViewController: UIViewController, BindableType {
    
    var viewModel: DetailViewModel!

    @IBOutlet private var genreLabel: UILabel!
    @IBOutlet private var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bindViewModel() {
        let input = DetailViewModel.Input(
            loadTrigger: Driver.just(())
        )
        let output = viewModel.transform(input)
        output.nameTrack
            .drive(nameLabel.rx.text)
            .disposed(by: rx.disposeBag)
        output.genreTrack
            .drive(genreLabel.rx.text)
            .disposed(by: rx.disposeBag)
    }

}

extension DetailViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}
