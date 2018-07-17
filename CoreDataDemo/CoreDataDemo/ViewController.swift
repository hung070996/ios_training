//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Do Hung on 7/17/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet var ageTextfield: UITextField!
    @IBOutlet var nameTextfield: UITextField!
    @IBOutlet var idTextfield: UITextField!
    @IBOutlet var tblView: UITableView!
    
    var appDelegate : AppDelegate?
    var context : NSManagedObjectContext?
    var req : NSFetchRequest<NSFetchRequestResult>?
    var list = [Student2]()
    override func viewDidLoad() {
        super.viewDidLoad()
        appDelegate = UIApplication.shared.delegate as? AppDelegate
        context = appDelegate?.persistentContainer.viewContext
        loadData()
    }
    
    func loadData() {
        req = NSFetchRequest<NSFetchRequestResult>.init(entityName: "Student")
        req?.returnsObjectsAsFaults = false
        do {
            let result = try context?.fetch(req!)
            list = [Student2]()
            for r in result as! [NSManagedObject] {
                let s = Student2(id: r.value(forKey: "id") as! Int, name: r.value(forKey: "name") as! String, age: r.value(forKey: "age") as! Int)
                list.append(s)
            }
            tblView.reloadData()
        } catch {
            
        }
    }

    @IBAction func clickAdd(_ sender: Any) {
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context!)
        student.setValue(Int(idTextfield.text!), forKey: "id")
        student.setValue(nameTextfield.text, forKey: "name")
        student.setValue(Int(ageTextfield.text!), forKey: "age")
        do {
            try context?.save()
            loadData()
        } catch {
            
        }
    }
}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "1")
        let s = list[indexPath.row]
        cell.textLabel?.text = "\(s.id!). \(s.name!)"
        cell.detailTextLabel?.text = "\(s.age!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle,
                   forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            do {
                let result = try context?.fetch(req!)
                context?.delete(result![indexPath.row] as! NSManagedObject)
                try context?.save()
                loadData()
            } catch {
                
            }
            break
        default:
            break
        }
    }
    
}
