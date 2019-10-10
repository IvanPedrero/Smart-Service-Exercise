//
//  BatteryInfo.swift
//  ServiceTest
//
//  Created by Ivan Pedrero on 10/9/19.
//  Copyright © 2019 Ivan Pedrero. All rights reserved.
//

import UIKit
import Foundation
import FirebaseDatabase

class BatteryInfo{
    
    class var batteryLevel:Float{
        return (UIDevice.current.batteryLevel * 100)
    }
        
    //Class func to call it everywhere without worring about objects.
    class func saveBatteryLevel(){
        
        //Save the battery level to the user defaults.
        UserDefaults.standard.set(batteryLevel, forKey: "batteryLevel")
        
        //Retreive it.
        print(UserDefaults.standard.float(forKey: "batteryLevel"))
        
    }
    
    class func uploadBatteryLevel(){
        
        //If the battery level was previously set...
        if UserDefaults.standard.string(forKey: "batteryLevel") != nil{
            
           //Save battery level.
           let ref = Database.database().reference()
           ref.child("battery/level").setValue(batteryLevel)
           
           //ACK message in the console.
           print("\n\nSaved battery level in firebase...\n\n")
            
        } else {
            //The application haven't changed the battery level yet, won't save at start.
           print("\n\nWon't save in firebase, data does not exist...\n\n")
        }
        
        
    }
}
