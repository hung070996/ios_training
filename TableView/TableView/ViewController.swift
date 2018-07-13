//
//  ViewController.swift
//  TableView
//
//  Created by Do Hung on 7/13/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var arrIcon : [String]!
    var arrAccessory : [String]!
    var arrLabel : [String]!
    var arrSection : [String]!
    var numberOfCell : Int!
    var arrContent : [ContentCell]!
    var isEditingTable = false
    let refreshControl = UIRefreshControl()

    @IBOutlet var editButton: UIButton!
    @IBOutlet var tblView: UITableView!
    @IBAction func clickEdit(_ sender: Any) {
        if isEditingTable {
            isEditingTable = false
            tblView.isEditing = false
            editButton.setTitle("Edit", for: .normal)
        } else {
            isEditingTable = true
            tblView.isEditing = true
            editButton.setTitle("Done", for: .normal)
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(updateData), for: .valueChanged)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        tblView.rowHeight = UITableViewAutomaticDimension
        tblView.estimatedRowHeight = 100
        
        numberOfCell = 20
        arrIcon = ["ic1", "ic2", "ic3"]
        arrAccessory = ["ic4", "ic5.jpg"]
        arrSection = ["Section1", "Section2", "Section3"]
        arrContent = [ContentCell]()
        arrLabel = ["ádnjansdjk", "sahduajsdasudhauishdaudkasduhasdkasd", "sahduajsdasudhauishdaudkasduhasdkasdsahduajsdasudhauishdaudkasduhasdkasd", "sahduajsdasudhauishdaudkasduhasdkasdsahduajsdasudhauishdaudkasduhasdkasdsahduajsdasudhauishdaudkasduhasdkasdsahduajsdasudhauishdaudkasduhasdkasdsahduajsdasudhauishdaudkasduhasdkasdsahduajsdasudhauishdaudkasduhasdkasdsahduajsdasudhauishdaudkasduhasdkasdsahduajsdasudhauishdaudkasduhasdkasd"]
        for i in 1...numberOfCell {
            let c = ContentCell()
            c.title = arrLabel[i % arrLabel.count]
            c.img = arrIcon[i % arrIcon.count]
            c.accessory = arrAccessory[i % arrAccessory.count]
            arrContent.append(c)
        }
    }
    
    @objc func updateData() {
        arrContent.insert(arrContent[10], at: 0)
        tblView.reloadData()
        self.refreshControl.endRefreshing()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            tblView.frame.size.height -= keyboardSize.height
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            tblView.frame.size.height += keyboardSize.height
        }
    }
    
}

extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return arrSection.count
//    }
//
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return arrSection[section]
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! CustomCell
        cell.img.image = UIImage.init(named: arrContent[indexPath.row].img)
        cell.lbl.text = "\(indexPath.row). " + arrContent[indexPath.row].title
        cell.accessoryView = UIImageView.init(image: UIImage.init(named: arrContent[indexPath.row].accessory))
        cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 24, height: 24)
        return cell
    }
    
//    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
//        return false
//    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = arrContent[sourceIndexPath.row]
        arrContent.remove(at: sourceIndexPath.row)
        arrContent.insert(movedObject, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            arrContent.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            break
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let more = UITableViewRowAction(style: .normal, title: "More") { action, index in
            print("more button tapped")
        }
        more.backgroundColor = .lightGray
        let favorite = UITableViewRowAction(style: .normal, title: "Favorite") { action, index in
            print("favorite button tapped")
        }
        favorite.backgroundColor = .orange
        return [favorite, more]
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == arrContent.count - 1 {
            for _ in 1...5 {
                arrContent.append(arrContent[Int(arc4random_uniform(UInt32(arrContent.count-1)))])
            }
            tableView.reloadData()
        }
    }
    
}

