//
//  WeatherModel.swift
//  Clima
//
//  Created by mac on 16/06/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let conditionId: Int
    let cityName: String
    let temperature: Double
    
    var temperatureString: String {
        return String(format: "%.1f", temperature)
    }
    
    var conditionName: String {
        switch conditionId {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "snow"
        case 701..<712:
            return "cloud.fog"
        case 711..<721:
            return "smoke"
        case 721..<731:
            return "sun.dust"
        case 731..<741:
            return "sun.dust"
        case 741..<751:
            return "cloud.fog"
        case 761:
            return "sun.dust"
        case 762:
            return "cloud.fog"
        case 771:
            return "wind"
        case 781:
            return "tornado"
        case 800:
            return "sun.max"
        case 801..<805:
            return "cloud.bolt"
        default:
            return "cloud"
        }
    }
    
}

