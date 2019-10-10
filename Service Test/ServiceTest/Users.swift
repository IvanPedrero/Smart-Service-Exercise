//
//  Users.swift
//  ServiceTest
//
//  Created by Ivan Pedrero on 10/8/19.
//  Copyright © 2019 Ivan Pedrero. All rights reserved.
//

import Foundation

class Users {

    private var gender:String = ""
    private var name:String = ""
    private var email:String = ""
    private var username:String = ""
    private var password:String = ""
    private var id:String = ""
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

    public var idItem:String{
        get{
            return id
        }
        
        set(iti){
            id = iti
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
    
    init(name:String){
        self.gender = ""
        self.name = name
        self.email = ""
        self.username = ""
        self.password = ""
        self.id = ""
        self.thumbnailLink = ""
    }
}
