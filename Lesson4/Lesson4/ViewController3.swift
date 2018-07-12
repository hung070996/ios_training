//
//  ViewController3.swift
//  Lesson4
//
//  Created by Do Hung on 7/12/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {
    
    var onComplete : ((_ data : String) -> Void)?

    @IBOutlet var textfiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillDisappear(_ animated: Bool) {
        onComplete?(textfiled.text!)
    }

}
