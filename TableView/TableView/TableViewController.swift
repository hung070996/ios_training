//
//  TableViewController.swift
//  TableView
//
//  Created by Do Hung on 7/13/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var arrIcon : [String]!
    var arrLabel : [String]!
    var numberOfCell : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 1000
        numberOfCell = 20
        arrIcon = ["ic1", "ic2", "ic3"]
        arrLabel = ["ádnjansdjk", "sahduajsdasudhauishdaudkasduhasdkasd", "sahduajsdasudhauishdaudkasduhasdkasdsahduajsdasudhauishdaudkasduhasdkasd", "sahduajsdasudhauishdaudkasduhasdkasdsahduajsdasudhauishdaudkasduhasdkasdsahduajsdasudhauishdaudkasduhasdkasdsahduajsdasudhauishdaudkasduhasdkasdsahduajsdasudhauishdaudkasduhasdkasdsahduajsdasudhauishdaudkasduhasdkasdsahduajsdasudhauishdaudkasduhasdkasdsahduajsdasudhauishdaudkasduhasdkasd"]
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfCell
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! CustomCell
        cell.img.image = UIImage.init(named: arrIcon[indexPath.row % arrIcon.count])
        cell.lbl.text = arrLabel[indexPath.row % arrLabel.count]
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
