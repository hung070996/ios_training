//
//  ViewController.swift
//  Lesson7
//
//  Created by Do Hung on 7/17/18.
//  Copyright © 2018 Do Hung. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var ageTextfield: UITextField!
    @IBOutlet var nameTextfield: UITextField!
    var students = [Student]()
    var db : Connection!
    var stu : Table!
    var id, age : Expression<Int>!
    var name : Expression<String>!

    @IBAction func clickAdd(_ sender: Any) {
        let s = Student(name: nameTextfield.text!, age: Int(ageTextfield.text!)!)
        let insert = stu.insert(name <- s.name, age <- s.age)
        do {
            try db.run(insert)
            loadTable()
        } catch {
            
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        do {
            db = try Connection("/Users/dohung/Desktop/ios_training/Lesson7/Lesson7/demoSQLite.db")
            stu = Table("Student")
            id = Expression<Int>("id")
            name = Expression<String>("name")
            age = Expression<Int>("age")
            loadTable()
        } catch {
            
        }
    }
    
    func loadTable() {
        do {
            students = [Student]()
            for s in try db.prepare(stu) {
                let student = Student(id: Int(s[id]), name: s[name], age: Int(s[age]))
                students.append(student)
            }
            tableView.reloadData()
        } catch {
            
        }
        
        
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        let s = students[indexPath.row]
        cell.textLabel?.text = "\(s.id!). \(s.name!)"
        cell.detailTextLabel?.text = "\(s.age!)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle,
                   forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
//            students.remove(at: indexPath.row)
            let s = students[indexPath.row]
            let alice = stu.filter(id == s.id)
            do {
                try db.run(alice.delete())
                loadTable()
            } catch {
                
            }
            
            break
        default:
            break
        }
    }
}

