//
//  TodoList.swift
//  iTahDoodle
//
//  Created by Yuxing Hu on 2018/7/11.
//  Copyright © 2018 Yuxing Hu. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    
    private let fileURL: URL = {
        let documentDirectoryURLs = FileManager.default.urls(
            for:. documentDirectory, in: .userDomainMask)
        let documentDirectoryURL = documentDirectoryURLs.first!
        return documentDirectoryURL.appendingPathComponent("todolist.items")
    }()
    
    
    fileprivate var items: [String] = []
    
    func saveItems() {
        let itemsArray = items as NSArray
        print("Saving items to \(fileURL)")
        if !itemsArray.write( to: fileURL, atomically: true) {
            print("Could not save to-do list")
        }
    }
    
    func loadItems() {
        if let itemsArray = NSArray( contentsOf: fileURL) as? [String] {
            items = itemsArray
        }
    }

    func add(_ item: String){
        items.append(item)
    }
    
    override init() {
        super.init()
        loadItems()
    }
    
}

extension TodoList : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell( withIdentifier: "Cell", for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel!.text = item
        return cell
    }
}

