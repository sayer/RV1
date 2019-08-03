//
//  TMSConnect.swift
//  RV1
//
//  Created by Stephen Ayers on 8/1/19.
//  Copyright © 2019 Stephen Ayers. All rights reserved.
//

import Foundation
import Socket
import UIKit

var ConnectError: Error! = nil
var SingleConnection:TMSConnect! = nil

struct TMSConnect
{
    let hostname = "10.100.254.10"
    let port = Int32(51966)
    let timeout = UInt(3000)
    var  foreTravelTMS: Socket
    var connected = false
    var messagesReceived = 0
    private var array: Array<String>
    private var index = 0;
    private var failureCount = 0
    let queue = DispatchQueue(label: "readQueue")
    
    init()
    {
        connected = false
        array = []
        foreTravelTMS = try! Socket.create()
        SingleConnection = self
    }
    
    func updateStats()
    {
        DispatchQueue.main.async {
            // message UI that stats are updated
            
        }
    }
    
    mutating func readLoop()
    {
        queue.async {
            while (true)
            {
                print("ReadLoop")
                if (!SingleConnection.connected || SingleConnection.failureCount > 4)
                {
                    SingleConnection.connect()
                }
                SingleConnection.readLive()
                SingleConnection.updateStats()
                sleep(3)
            }
        }
    }
    
    mutating func connect() -> Bool
    {
        connected = false
        ConnectError = nil
        failureCount = 0
        do {
            if (foreTravelTMS.isConnected)
            {
                foreTravelTMS.close()
                foreTravelTMS = try! Socket.create()
            }
            try foreTravelTMS.connect(to: hostname, port: port, timeout: timeout)
        } catch {
            print(error)
            failureCount += 1
            ConnectError = error;
            return false
        }
        
        do {
            try! foreTravelTMS.setReadTimeout(value: UInt(10000))
            let first = try foreTravelTMS.readString()
            print(first!)
            if (first == "*HELLO*")
            {
                connected = true
                failureCount = 0
            }
        } catch {
            print(error)
            ConnectError = error;
            failureCount += 1
            return false
        }
        return connected
    }
    
    
    
    mutating func readPayload() throws -> String
    {
        var payload: String = ""
        while (true)
        {
            do {
                try! foreTravelTMS.setReadTimeout(value: UInt(1000))
                let liveData = try foreTravelTMS.readString()
                print(liveData!)
                if (liveData != nil )
                {
                    payload += liveData!
                }
            } catch {
                print(error)
                failureCount += 1
                if (payload.count > 0)
                {
                    return(payload)
                }
                ConnectError = error;
                
                throw error
            }
        }
        return(payload)
    }
    
    mutating func sendHeartbeat() -> Bool
    {
        do {
            try foreTravelTMS.write(from: "V\n")
        }
        catch
        {
            print("unable to write: \(error.localizedDescription)")
            ConnectError = error
            failureCount += 1
            return false
        }
        return true
    }
    
    mutating func readLive()
    {
        if (connected)
        {
            
            if (!sendHeartbeat())
            {
                return
            }
            
            do {
                
                let liveData = try readPayload()
                print(liveData)
                if (liveData.count > 0 )
                {
                    index = 0;
                    array = liveData.components(separatedBy: "\r\n")
                    print(array)
                    loadMessages()
                }
            } catch {
                print(error)
                ConnectError = error;
            }
        }
    }
    
    private mutating func storeDG(dg: BaseDG)
    {
        let key = dg.event + String(dg.instance);
        dgDict.updateValue(dg, forKey: key)
    }
    
    
    mutating func loadMessages()
    {
        var dg: BaseDG! = nextDG()
        while (dg != nil)
        {
            print("event \(dg.describe())")
            messagesReceived += 1
            storeDG(dg: dg)
            dg = nextDG()
        }
    }
    
    mutating func nextDG() -> BaseDG!
    {
        let line = nextLine()
        if (line != nil && line?.count ?? 0 > 15)
        {
            let test: BaseDG = BaseDG(message: line!, timeStamp: Date())
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

