//
//  ViewController.swift
//  Lesson4
//
//  Created by Do Hung on 7/12/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ViewController2Response {
    @IBOutlet var resultLabel: UILabel!
    
    func getData(data: String) {
        resultLabel.text = data
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func clickPresent(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc: UIViewController = storyboard.instantiateViewController(withIdentifier: "vc4") as! ViewController4
        self.present(vc, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "tovc2" {
            let vc = segue.destination as! ViewController2
            vc.delegate = self
        } else if segue.identifier == "tovc3" {
            let vc = segue.destination as! ViewController3
            vc.onComplete = { [weak self] data in
                self?.resultLabel.text = data
            }
        }
        
    }
}

