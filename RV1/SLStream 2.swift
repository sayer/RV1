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
    
    
    init()
    {
        array = []
        dgDict = [:]
        index = 0
        openStaticData()
    }
    
    private mutating func storeDG(dg: BaseDG)
    {
        let key = dg.event + String(dg.instance);
        dgDict.updateValue(dg, forKey: key)
    }
    
    func dg(event: String, instance: Int) -> BaseDG!
    {
        let key = event + String(instance);
        return dgDict[key]
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
        var dg: BaseDG = nextDG()
        while (dg != nil)
        {
            print("event \(dg.event)")
            if (dg.event == String("1FFB7"))
            {
                print(dg.tankSize)
            }
            storeDG(dg: dg)
            dg = nextDG()
        }
    }
    
    mutating func nextDG() -> BaseDG
    {
        let test: BaseDG = BaseDG(message: nextLine())
        print(test.event)
        print(test.source)
        return test
    }
    
    mutating func nextLine() -> String
    {
        defer { index += 1 }
        
        return array[index]
    }
}
