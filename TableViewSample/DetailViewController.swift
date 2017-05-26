//
//  DetailViewController.swift
//  TableViewSample
//
//  Created by ichi on 2017/05/25.
//  Copyright © 2017年 Rhizome. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var greetings: UILabel!
    var message : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setup(){
        //遷移元から渡された値をUILabelにセット。
        self.greetings!.text = self.message
    }

    
    @IBAction func dismissButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
