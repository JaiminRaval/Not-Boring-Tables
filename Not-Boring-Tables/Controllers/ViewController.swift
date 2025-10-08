//
//  ViewController.swift
//  Not-Boring-Tables
//
//  Created by Jaimin Raval on 04/09/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var jokeArr: [JokeModel] = []
    
    @IBOutlet weak var MyDataTable: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        ApiManager.shared.fetchJokes { [self] res in
            switch res {
            case .success(let data):
                jokeArr = data
                DispatchQueue.main.async { [self] in
                    MyDataTable.reloadData()
                }
                
            case .failure(let err):
                print(err)
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        MyDataTable.dataSource = self
        MyDataTable.delegate = self
        MyDataTable.register(UINib(nibName: "MyDataCell", bundle: nil), forCellReuseIdentifier: "MyDataCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokeArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyDataCell") as! MyDataCell
//        debug using print
//        print(indexPath.row)
        cell.NameTxt.text = "\(jokeArr[indexPath.row].id)"
        cell.powerTxt.text = "\(jokeArr[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//        step-1:
        let delAction = UIContextualAction(style: .destructive, title: "Delete") { action, v, completionHandler in
            self.jokeArr.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

            completionHandler(true)
        }
        
        delAction.backgroundColor = .red
        delAction.image = UIImage(systemName: "trash")
        
        let config = UISwipeActionsConfiguration(actions: [delAction])
        config.performsFirstActionWithFullSwipe = false
        
        return config

    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(
            style: .destructive,
            title: "Delete") { action, view, completion in
                self.jokeArr.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                completion(true)
                
            }
        deleteAction.image = UIImage(systemName: "trash")
        let config = UISwipeActionsConfiguration(actions: [deleteAction])
        
        return config
    }

    
    
//    @IBAction func addBtnPressed(_ sender: Any) {
//        superheroNames.append("Thor")
//        superPowers.append("Lightings")
//        
//        print(superheroNames.last!)
//        print(superPowers.last!)
//        MyDataTable.reloadData()
//        
//    }
    
}

