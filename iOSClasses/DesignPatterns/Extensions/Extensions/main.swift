//
//  main.swift
//  Extensions
//
//  Created by mac on 16/06/20.
//  Copyright © 2020 saulofreire. All rights reserved.
//

import Foundation

extension Double {
    func round(to places: Int) -> Double {
        let precisionNumber = pow(10, Double(places))
        var n = self
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }
}

var myDouble = 3.14159

print(myDouble.round(to: 3))
