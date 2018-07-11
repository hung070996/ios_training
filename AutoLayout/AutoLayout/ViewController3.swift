//
//  ViewController3.swift
//  AutoLayout
//
//  Created by Do Hung on 7/11/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet var viewContainer: UIView!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var registerButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContainer.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
        registerButton.layer.cornerRadius = 5
        loginButton.layer.borderColor = UIColor.white.cgColor
        registerButton.layer.borderColor = UIColor.white.cgColor
        loginButton.layer.borderWidth = 1.0
        registerButton.layer.borderWidth = 1.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
