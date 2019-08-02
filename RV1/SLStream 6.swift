//
//  SLStream.swift
//  RV1
//
//  Created by Stephen Ayers on 7/31/19.
//  Copyright © 2019 Stephen Ayers. All rights reserved.
//

import Foundation

struct SLStream {
    private var array: Array<String>
    private var index = 0;
    private var connect: TMSConnect
    
    init()
    {
        array = []
        dgDict = [:]
        index = 0
        loadDGNTable()
        connect = TMSConnect()
        openStaticData()
        connect.connect()
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
            print("event \(dg.describe())")
            if (dg.event == TANK_STATUS)
            {
                print(dg.tankSize)
            }
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
