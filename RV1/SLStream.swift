//
//  SLStream.swift
//  RV1
//
//  Created by Stephen Ayers on 7/31/19.
//  Copyright © 2019 Stephen Ayers. All rights reserved.
//

import Foundation
import CoreLocation

struct SLStream {
    private var array: Array<String>
    private var index = 0;
    private var connect: TMSConnect
    private var messagesLoaded = 0
    
    init()
    {
        array = []
        dgDict = [:]
        index = 0
        loadDGNTable()
        connect = TMSConnect()
        openStaticData()
        connect.connect()
        connect.readLoop()
    }
    
    var messagesProcessed: Int
    {
        get {
            return connect.messagesReceived + messagesLoaded
        }
    }
    
    mutating func readLive()
    {
        // move to worker queue
        connect.readLive()
    }
    
    mutating func reconnect()
    {
        // move to worker queue
        connect.connect()
        connect.readLive()
    }
    
    
    private mutating func storeDG(dg: BaseDG)
    {
        let key = dg.event + String(dg.instance);
        dgDict.updateValue(dg, forKey: key)
    }
    
    
    
    private mutating func openStaticData() {
        array = []
        index = 0
        if let filepath = Bundle.main.path(forResource: "StaticData", ofType: "") {
            do {
                let contents = try String(contentsOfFile: filepath)
                array = contents.components(separatedBy: ["\n"])
                index = 0
                loadMessages()
                
            } catch {
                // contents could not be loaded
            }
        } else {
            // example.txt not found!
        }
    }
    
    func describe() {
        print("file contents: \(array)")
    }
    
    mutating func loadMessages()
    {
        var dg: BaseDG! = nextDG()
        while (dg != nil)
        {
            if (dg.event == TANK_STATUS)
            {
                print(dg.tankSize)
            }
            storeDG(dg: dg)
            messagesLoaded += 1
            dg = nextDG()
        }
    }
    
    mutating func nextDG() -> BaseDG!
    {
        let line = nextLine()
        if (line != nil)
        {
            let test: BaseDG = BaseDG(message: line!, timeStamp: Date(), location: CLLocation(latitude: 0,longitude: 0))
            return test
        }
        return nil
    }
    
    mutating func nextLine() -> String!
    {
        defer { index += 1 }
        if (index < array.count)
        {
            return array[index].count != 0 ? array[index] : nil
        }
        else
        {
            return nil
        }
    }
}
