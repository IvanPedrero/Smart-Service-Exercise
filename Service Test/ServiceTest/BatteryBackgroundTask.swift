//
//  BatteryBackgroundTask.swift
//  ServiceTest
//
//  Created by Ivan Pedrero on 10/10/19.
//  Copyright © 2019 Ivan Pedrero. All rights reserved.
//

import Foundation
import UIKit

class BatteryBackgroundTask{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Setup Fetch Interval
    UIApplication.shared.setMinimumBackgroundFetchInterval(UIApplication.backgroundFetchIntervalMinimum)
        return true
    }

    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // Create url which from we will get fresh data
        if let url = URL(string: "https://www.vialyx.com") {
            // Send request
            URLSession.shared.dataTask(with: url, completionHandler: { (data, respone, error) in
                // Check Data
                guard let `data` = data else { completionHandler(.failed); return }
                // Get result from data
                let result = String(data: data, encoding: .utf8)
                // Print result into console
                print("performFetchWithCompletionHandler result: \(String(describing: result))")
                // Call background fetch completion with .newData result
                completionHandler(.newData)
            }).resume()
        }
    }
}
