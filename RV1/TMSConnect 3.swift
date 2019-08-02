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

struct TMSConnect
{
    let hostname = "10.100.254.10"
    let port = Int32(51966)
    let timeout = UInt(3000)
    let  foreTravelTMS = try! Socket.create()
    var connected = false
    private var array: Array<String>
    private var index = 0;
    
    init()
    {
        connected = false
        array = []
    }
    
    mutating func connect() -> Bool
    {
        // close if connected
        //foreTravelTMS.close()
        connected = false
        ConnectError = nil;
        
        do {
            try foreTravelTMS.connect(to: hostname, port: port, timeout: timeout)
        } catch {
            print(error)
            ConnectError = error;
            return false
        }
        
        do {
            //try! foreTravelTMS.setReadTimeout(value: UInt(10000))
            let first = try foreTravelTMS.readString()
            print(first!)
            connected = true
            //alertWindow(title: "Connected!!!!!", message: "first bytes: \(first ?? ":-(")")
        } catch {
            print(error)
            ConnectError = error;
            return false
        }
        return connected
    }
    
    mutating func queueReadLive()
    {
     DispatchQueue.main.asyncAfter(deadline: .now() + 10.0, execute: {
        //self.readLive()
     })
    }
    
    mutating func readLive()
    {
        if (connected)
        {
            do {
                try foreTravelTMS.write(from: "V\n")
            }
            catch
            {
                print("unable to write: \(error.localizedDescription)")
                ConnectError = error
                queueReadLive()
                return
            }
            
            do {
                //try! foreTravelTMS.setReadTimeout(value: UInt(10000))
                let liveData = try foreTravelTMS.readString()
                print(liveData!)
                if (liveData != nil )
                {
                    index = 0;
                    array = liveData!.components(separatedBy: "\r\n")
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
                storeDG(dg: dg)
                dg = nextDG()
            }
        }
        
        mutating func nextDG() -> BaseDG!
        {
            let line = nextLine()
            if (line != nil)
            {
                let test: BaseDG = BaseDG(message: line!)
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

