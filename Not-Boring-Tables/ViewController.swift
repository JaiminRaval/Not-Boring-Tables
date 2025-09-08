//
//  ViewController.swift
//  Not-Boring-Tables
//
//  Created by Jaimin Raval on 04/09/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var arr = ["Apple", "John", "Tony", "Logan"]

    @IBOutlet weak var MyDataTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MyDataTable.dataSource = self
        MyDataTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyDataCell") as! MyDataCell
        print(indexPath.row)
        cell.NameTxt.text = "\(arr[indexPath.row])"
        return cell
    }


}

