//
//  DetailViewController.swift
//  ServiceTest
//
//  Created by Ivan Pedrero on 10/8/19.
//  Copyright © 2019 Ivan Pedrero. All rights reserved.
//

import Foundation
import  UIKit

class DetailViewController:UIViewController{
    
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var usernameText: UILabel!
    @IBOutlet weak var emailText: UILabel!
    @IBOutlet weak var phoneText: UILabel!
    @IBOutlet weak var locationText: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    
    @IBOutlet weak var thumbnailView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInformation()
        
    }
    
    func setInformation(){
        
        let it:UserItem = (UserDatabase.getInstance().itemToEdit!)
        
        nameText.text = it.nameItem
        usernameText.text = it.usernameItem
        genderLabel.text = it.genderItem
        emailText.text = it.emailItem
        phoneText.text = it.phoneItem
        locationText.text = it.locationItem
        
        let url = URL(string: it.thumbnailItem)!
        let data = try? Data(contentsOf: url)
        if let imageData = data{
            let image = UIImage(data: imageData)
            thumbnailView.image = image
        }
    }

    @IBAction func finalizeTask(_ sender: Any) {
        var _:UserItem =  UserDatabase.getInstance().itemToEdit!

        navigationController?.popViewController(animated: true)
        
    }
}
