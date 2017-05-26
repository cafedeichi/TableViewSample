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
    
    let tableViewCellIdentifier = "TableViewCellIdentifier"     //セルを再利用する為のID
    
    //従業員一覧
    let staff = [
        "Malcolm",
        "Kaylee",
        "Bob",
        "Ken",
        "Nancy",
        "Mike"
    ]
    
    //従業員の職業
    let occupation = [
        "Malcolm": "Captain",
        "Kaylee": "Mechanic",
        "Bob": "Mechanic",
        "Ken": "Mechanic",
        "Nancy": "Accountant",
        "Mike": "Accountant"
    ]
    
    //アプリ起動時に呼ばれるメソッド・自動生成される。
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Swift.debugPrint(#function)
        self.setup()
    }
    
    //ViewContorllerのViewが表示された時
    override func viewDidAppear(_ animated: Bool) {
        Swift.debugPrint(#function)
        super.viewDidAppear(animated)   //superを呼ぶのを忘れずに
    }
    
    //ViewContorllerのViewが表示される前
    override func viewWillAppear(_ animated: Bool) {
        Swift.debugPrint(#function)
        super.viewWillAppear(animated)
    }
    
    //ViewContorllerのViewが非表示になる前
    override func viewWillDisappear(_ animated: Bool) {
        Swift.debugPrint(#function)
        super.viewWillDisappear(animated)
    }
    
    //ViewContorllerのViewが非表示になった後
    override func viewDidDisappear(_ animated: Bool) {
        Swift.debugPrint(#function)
        super.viewDidAppear(animated)
    }
    
    //アプリが著しくメモリを消費した時に呼ばれるメソッド。自動生成される。
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //自作メソッド
    func setup(){
        self.tableView.dataSource = self    //TableViewのDataSourceメソッドを使う宣言
        self.tableView.delegate = self      //TableViewのDelegateメソッドを使う宣言
    }
    
}

extension ViewController : UITableViewDataSource {
    
    //テーブルのデータ件数を決めるメソッド。実装必須。
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.staff.count
    }
    
    //テーブルの各セルの表示処理を行う。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        Swift.debugPrint(#function,"indexPath:\(indexPath.row)")
        
        //既に存在しているcellを再利用する。"tableViewCellIdentifier"をキーにメモリに保存されているcellをもってくる。
        var cell : UITableViewCell! = tableView.dequeueReusableCell(withIdentifier: self.tableViewCellIdentifier)
        
        if cell == nil {
            //セルを生成。再利用のIDは"tableViewCellIdentifier"
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: self.tableViewCellIdentifier)
        }
        
        //データの表示。indexPath.rowでセルの行番号を取得（0からはじまる）
        cell.textLabel?.text = self.staff[indexPath.row]                            //メイン
        cell.detailTextLabel?.text = self.occupation[self.staff[indexPath.row]]     //サブ
        cell.imageView?.image = UIImage(named: "staff")                             //アイコン
        
        return cell
        
    }
    
}

extension ViewController : UITableViewDelegate {
    
    //セルが選択された時の処理
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        //アラートビューの表示。上から件名、メッセージ、スタイル。
//        let alert = UIAlertController(title:"Greetings",message: "Hi, I'm \(self.staff[indexPath.row]).",preferredStyle: UIAlertControllerStyle.alert)
//
//        //OKを押した時のアクションを作成。
//        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
//            tableView.deselectRow(at: indexPath, animated: true)
//        }
//
//        //作成したアクションをアラートビューに紐づける。
//        alert.addAction(okAction)
//        //実際にアラートを表示。
//        self.present(alert, animated: true, completion: nil)
        
        //messageプロパティに値を設定して画面遷移。
        let viewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
        viewController.message = "Hi, I'm \(self.staff[indexPath.row])."
        self.present(viewController, animated: true, completion: nil)
        
        
        
    }
}


