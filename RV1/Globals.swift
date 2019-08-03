//
//  Globals.swift
//  RV1
//
//  Created by Stephen Ayers on 8/1/19.
//  Copyright © 2019 Stephen Ayers. All rights reserved.
//

import Foundation
import UIKit

var dgDict: Dictionary<String, BaseDG> = [:]

func stringRange(string: String, start: Int, count: Int) -> String
{
    let stop = start+count < string.count ? start+count : string.count
    if (start > stop) { return "" }
    let startIndex = string.index(string.startIndex, offsetBy: start)
    let endIndex = string.index(string.startIndex, offsetBy: stop)
    let range = startIndex ..< endIndex
    let payload = string[range]
    return String(payload)
}

func dg(event: String, instance: Int) -> BaseDG!
{
    let key = event + String(instance);
    return dgDict[key]
}

func alertWindow(title: String, message: String) {
    DispatchQueue.main.async(execute: {
        let alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = UIWindow.Level.alert + 1
        
        let alert2 = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let defaultAction2 = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert2.addAction(defaultAction2)
        
        alertWindow.makeKeyAndVisible()
        
        alertWindow.rootViewController?.present(alert2, animated: false, completion: nil)
    })
}
