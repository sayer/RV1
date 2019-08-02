//
//  DGNLookup.swift
//  RV1
//
//  Created by Stephen Ayers on 8/1/19.
//  Copyright © 2019 Stephen Ayers. All rights reserved.
//

import Foundation

var DGNTable: Dictionary<String, String> = [:]

func loadDGNTable()
{
    if let filepath = Bundle.main.path(forResource: "DGNTable", ofType: "") {
        do {
            let contents = try String(contentsOfFile: filepath)
            let array = contents.components(separatedBy: ["\n"])
            for line in array {
                if (line.count > 0) {
                    let key = stringRange(string: line, start: 0, count:5)
                    let description = stringRange(string: line, start: 9, count: 99)
                    if (key.count > 0)
                    {
                        DGNTable.updateValue(description, forKey: key)
                    }
                }
            }
        } catch {
            // contents could not be loaded
        }
    } else {
        // example.txt not found!
    }
}
