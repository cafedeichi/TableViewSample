//
//  ViewController.swift
//  TableViewSample
//
//  Created by ichi on 2017/05/25.
//  Copyright © 2017年 Rhizome. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let tableViewCellIdentifier = "TableViewCellIdentifier"
    
    let staff = [
        "Malcolm",
        "Kaylee",
        "Bob",
        "Ken",
        "Nancy",
        "Mike"
    ]
    
    let occupation = [
        "Malcolm": "Captain",
        "Kaylee": "Mechanic",
        "Bob": "Mechanic",
        "Ken": "Mechanic",
        "Nancy": "Accountant",
        "Mike": "Accountant"
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setup(){
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
}

extension ViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let alert = UIAlertController(title:"Greetings",
                                    message: "Hi, I'm \(self.staff[indexPath.row]).",
                                    preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "Greetrings", style: .default) { (_) in
            tableView.deselectRow(at: indexPath, animated: true)
        }
        
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.occupation.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: self.tableViewCellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: self.tableViewCellIdentifier)
        }
        
        cell.textLabel?.text = self.staff[indexPath.row]
        cell.detailTextLabel?.text = self.occupation[self.staff[indexPath.row]]
        cell.imageView?.image = UIImage(named: "staff")
        
        return cell
        
    }
    
}

