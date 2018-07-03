//
//  ViewController.swift
//  PakuPakuTodo
//
//  Created by 桜井広大 on 2018/07/03.
//  Copyright © 2018年 KotaSakurai. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var todoList = [String]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tapAddButton(_ sender: Any) {
        let alertController = UIAlertController(title: "Todo追加", message: "todoを入力してください", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField(configurationHandler: nil)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) { (action: UIAlertAction) in
            if let textField = alertController.textFields?.first {
                self.todoList.insert(textField.text!, at: 0)
                
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableViewRowAnimation.right)
            }
        }

        alertController.addAction(okAction)
                                        
        let cancelButton = UIAlertAction(title: "CANSEL", style: UIAlertActionStyle.cancel, handler: nil)
                                        
        alertController.addAction(cancelButton)
                                        
        present(alertController, animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        let todoTitle = todoList[indexPath.row]
        
        cell.textLabel?.text = todoTitle
        return cell
    }

}
