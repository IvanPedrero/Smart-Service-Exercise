//
//  ListTableViewController.swift
//  ServiceTest
//
//  Created by Video on 8/29/19.
//  Copyright © 2019 Ivan Pedrero. All rights reserved.
//

import Foundation
import UIKit

class ListTableViewController:UITableViewController{
            
    override func viewDidLoad() {
        //Emulate the level.
        //BatteryInfo.saveBatteryLevel()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //Added function to remove person from the list, only for testing.
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
        
        //Fetch the table.
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "table_view")!
        //Set the user from the database at the index path.
        let it:UserItem = UserDatabase.getInstance().db[indexPath.item]
        //Set the name.
        cell.textLabel?.text = it.nameItem
        //Set the user name.
        cell.detailTextLabel?.text = it.usernameItem

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //Selected an item at index, set it to a var.
        let it:UserItem = UserDatabase.getInstance().db[indexPath.item]
        //The item on edition will be the selected one.
        UserDatabase.getInstance().itemToEdit = it
        //Go to activity through segue.
        performSegue(withIdentifier: "goDetail", sender: nil)
        
    }
}
