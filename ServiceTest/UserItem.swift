//
//  Users.swift
//  ServiceTest
//
//  Created by Ivan Pedrero on 10/8/19.
//  Copyright © 2019 Ivan Pedrero. All rights reserved.
//

import Foundation

class UserItem {

    private var gender:String = ""
    private var name:String = ""
    private var email:String = ""
    private var username:String = ""
    private var password:String = ""
    private var phone:String = ""
    private var location:String = ""
    private var thumbnailLink:String = ""


    public var genderItem:String{
        get{
            return gender
        }
        
        set(itn){
            gender = itn
        }
    }
    
    public var nameItem:String{
        get{
            return name
        }
        
        set(ntn){
            name = ntn
        }
    }

    public var emailItem:String{
        get{
            return email
        }
        
        set(etn){
            email = etn
        }
    }

    public var usernameItem:String{
        get{
            return username
        }
        
        set(utn){
            username = utn
        }
    }
    
    public var passwordItem:String{
        get{
            return password
        }
        
        set(ptn){
            password = ptn
        }
    }
    
    public var phoneItem:String{
        get{
            return phone
        }
        set(ptn){
            phone = ptn
        }
    }
    
    public var locationItem:String{
        get{
            return location
        }
        
        set(ltn){
            location = ltn
        }
    }

    
    public var thumbnailItem:String{
        get{
            return thumbnailLink
        }
        
        set(ttn){
            thumbnailLink = ttn
        }
    }
    
    init(){
        self.gender = ""
        self.name = ""
        self.email = ""
        self.username = ""
        self.password = ""
        self.phone = ""
        self.location = ""
        self.thumbnailLink = ""
    }
}
