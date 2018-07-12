//
//  ViewController2.swift
//  Lesson4
//
//  Created by Do Hung on 7/12/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit

protocol ViewController2Response {
    func getData(data : String)
}

class ViewController2: UIViewController {

    var delegate : ViewController2Response?
    
    @IBOutlet var numberLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func clickAdd(_ sender: Any) {
        numberLabel.text = String(Int(numberLabel.text!)! + 1)
    }
    @IBAction func clickSub(_ sender: Any) {
        numberLabel.text = String(Int(numberLabel.text!)! - 1)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        delegate?.getData(data: numberLabel.text!)
    }
    
}
