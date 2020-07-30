//
//  Bill.swift
//  Tipsy
//
//  Created by mac on 08/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Bill {
    var value: Float
    var tip: Int
    var numberOfPeople: Int
    
    mutating func Calculate() -> String{
        var result: Float = 0.0
        
        if tip > 0 {
            result = value * ((Float(tip) / 100) + 1)
            result = result / Float(numberOfPeople)
        } else {
            result = value / Float(numberOfPeople)
        }
        let total = String(format: "%.2f", result)
        return total
    }
    
}
