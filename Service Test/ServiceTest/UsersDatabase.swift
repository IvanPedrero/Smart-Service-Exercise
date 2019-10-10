//
//  UsersDatabase.swift
//  ServiceTest
//
//  Created by Ivan Pedrero on 10/8/19.
//  Copyright © 2019 Ivan Pedrero. All rights reserved.
//

import Foundation

class UserDatabase: CustomStringConvertible{
    
    //Instance of the db
    private static var database:UserDatabase?
    
    private var items:Array<UserItem>?
    
    private var itemOnEdition:UserItem?
    
    public var itemToEdit:UserItem?{
        get{
            return itemOnEdition
        }
        set(p){
            itemOnEdition = p
        }
    }
    
    init(){
        items = Array<UserItem>()
    }
    
    public var db:Array<UserItem>{
        get{
            return items!
        }
        
        set(its){
            items = its
        }
    }
    
    public func appendItem(it:UserItem){
        items?.append(it)
    }
    
    public static func getInstance()->UserDatabase{
        if(database == nil){
            database = UserDatabase()
        }
        return database!
    }
    
    public func removeItem(index:Int){
        items?.remove(at: index)
    }
    
    public var description: String{
        return "\(db)"
    }
    
}

