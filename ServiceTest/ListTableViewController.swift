//
//  ListTableViewController.swift
//  ToDoListApp
//
//  Created by Video on 8/29/19.
//  Copyright © 2019 Ivan Pedrero. All rights reserved.
//

import Foundation
import UIKit

class ListTableViewController:UITableViewController{
            
    override func viewDidLoad() {

    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //remove to do item
        UserDatabase.getInstance().removeItem(index: indexPath.item)
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return UserDatabase.getInstance().db.count;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "table_view") as! UITableViewCell
        
        let it:UserItem = UserDatabase.getInstance().db[indexPath.item]
        
        cell.textLabel?.text = it.nameItem
        
        cell.detailTextLabel?.text = it.usernameItem

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let it:UserItem = UserDatabase.getInstance().db[indexPath.item]
        
        UserDatabase.getInstance().itemToEdit = it
        
        performSegue(withIdentifier: "goDetail", sender: nil)
    }
}
