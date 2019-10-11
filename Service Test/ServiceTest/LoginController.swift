//
//  LoginController.swift
//  ServiceTest
//
//  Created by Ivan Pedrero on 10/8/19.
//  Copyright © 2019 Ivan Pedrero. All rights reserved.
//

import UIKit
import Foundation

class LoginController: UIViewController, NSURLConnectionDelegate, NSURLConnectionDataDelegate {
    
    var data: NSMutableData = NSMutableData()
        
    private var firstIdValue:String = ""
    
    //Fields to get the information from.
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //var firstUser:UserItem?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Set the password textfield as hidden.
        passwordTextField.isSecureTextEntry = true
        
        //Get all the information.
        getJsonFromUrl()
    }

    @IBAction func login(_ sender: Any) {
        //Get the data from the text fields.
        let username:String = usernameTextField.text!
        let password:String = passwordTextField.text!
        
        //One of the constraints of the exercise was that the first user is the one who must be the one allowed to log in, so check if its the first user data or is empty.
        if username == "" ||
            password == ""  ||
            username != UserDatabase.getInstance().db[0].usernameItem ||
            password != UserDatabase.getInstance().db[0].passwordItem
            {
                //Login failed, show message.
                loginFailed()
                
                //Show hint on console.
                print("\n**********************")
                print("Correct credentials: ")
                print(UserDatabase.getInstance().db[0].usernameItem)
                print(UserDatabase.getInstance().db[0].passwordItem)
                print("**********************\n")
        }else{
            //Login succesful, go to the next view.
            goToTable()
        }
   
    }
    
    
    //This function will show an ERROR message is the login was unsuccesful.
    private func loginFailed(){
        let alert = UIAlertController(title: "ERROR", message: "Wrong password or username", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Accept", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    //This function will change scenes when login was succesful.
    private func goToTable(){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "tableUI")
                self.present(newViewController, animated: true, completion: nil)
    }
    
    
    //This function will connect to the api and retrieve a JSON object, subsequently adding it to the database.
    func getJsonFromUrl(){
        //Creating a NSURL
        let url = NSURL(string: "https://randomuser.me/api?results=20&seed=smartstc&nat=ES")
        
        //Fetch data
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
               
                //Get the results from the json
                if let array = jsonObj.value(forKey: "results") as? NSArray {
                    //looping through all the elements
                    for item in array{
                        //converting the element to a dictionary
                        if let itemDict = item as? NSDictionary {
                            //Iterate over every user item in the API
                            self.getUserInfo(user: (itemDict as NSDictionary))
                            
                        }
                    }
                }
            }
        }).resume()
    }
    
    //This function will get the JSON values and add them to a user 'database'.
    func getUserInfo(user:NSDictionary){
        
        let item:UserItem = UserItem()

        //Get gender.
        item.genderItem = user["gender"] as! String
        //Get name.
        if let name = user.value(forKey: "name") as? NSDictionary{
            let title:String = name["title"] as! String
            let first:String = name["first"] as! String
            let last:String = name["last"] as! String
            
            item.nameItem = title + " " + first + " " + last
        }
        //Get email.
        item.emailItem = user["email"] as! String
        //Get login info.
        if let login = user.value(forKey: "login") as? NSDictionary{
            item.usernameItem = login["username"] as! String
            item.passwordItem = login["password"] as! String
        }
        //Get picture
        if let picture = user.value(forKey: "picture") as? NSDictionary{
            item.thumbnailItem = picture["large"] as! String
        }
        //Get phone
        item.phoneItem = user["phone"] as! String
        //Get location.
        if let location = user.value(forKey: "location") as? NSDictionary{
            let city = location["city"] as! String
            let state = location["state"] as! String
            let country = location["country"] as! String
            
            item.locationItem = city + ", " + state + ", " + country
        }
        //Add the item to the database.
        UserDatabase.getInstance().appendItem(it: item)
        
    }
    
    //Hide keyboard on touch.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
