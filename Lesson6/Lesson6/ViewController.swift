//
//  ViewController.swift
//  Lesson6
//
//  Created by Do Hung on 7/16/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var results = [Result]()
    @IBOutlet var tblView: UITableView!
    @IBOutlet var loading: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loading.isHidden = true
        loading.startAnimating()
        tblView.rowHeight = UITableViewAutomaticDimension
        tblView.estimatedRowHeight = 100
    }
    @IBAction func clickLoad(_ sender: Any) {
        loading.isHidden = false
        let api = APIController()
        api.delegate = self
        api.callAPI()
        
    }
}

extension ViewController : APIControllerDelegate {
    func receivedData(results: [Result]) {
        DispatchQueue.main.async {
            self.results = results
            self.tblView.reloadData()
            self.loading.isHidden = true
        }
        
    }
}

extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        let rs = results[indexPath.row]
        cell.nameLabel.text = "Name: \(rs.name!)"
        cell.urlLabel.text = "Url: \(rs.url!)"
        if let des = rs.des {
            cell.desLabel.text = "Description: \(des)"
        } else {
            cell.desLabel.text = "Description: None"
        }
        cell.createLabel.text = "Create: \(rs.create!)"
        cell.sizeLabel.text = "Size: \(rs.size!)"
        cell.watcherLabel.text = "Watchers: \(rs.watcher!)"
        return cell
    }
    
    
}

