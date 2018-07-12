//
//  ViewController.swift
//  iTahDoodle
//
//  Created by Yuxing Hu on 2018/7/11.
//  Copyright © 2018 Yuxing Hu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var itemTextField: UITextField!
    
    @IBOutlet var tableView: UITableView!
    
    let todoList = TodoList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = todoList
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        guard let todo = itemTextField.text
            else {
                return
            }
        todoList.add(todo)
        tableView.reloadData()
    }
}


