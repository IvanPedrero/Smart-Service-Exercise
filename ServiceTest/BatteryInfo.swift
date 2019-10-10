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
        
    //Class func to call it everywhere without worring about objects.
    class func saveBatteryLevel(){
        
        //Var holding the battery level.
        var batteryLevel:Float{
            return (UIDevice.current.batteryLevel * 100)
        }
        
        //Save battery level.
        let ref = Database.database().reference()
        ref.child("batery/level").setValue(batteryLevel)
        
        //ACK message in the console.
        print("\nSaved battery level in firebase...\n")
    }
}
