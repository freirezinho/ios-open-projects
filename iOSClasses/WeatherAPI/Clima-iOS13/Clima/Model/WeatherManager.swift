//
//  WeatherManager.swift
//  Clima
//
//  Created by mac on 12/06/20.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weatherManager: WeatherManager , weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=87b5f406cbae00a299cee90f49fe02d4&units=metric"
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print("Fetching...")
        performRequest(with: urlString)
    }
    func fetchWeather(latitude: Double, longitude: Double) {
        var lat = latitude
        var lon = longitude
        let urlString = "\(weatherURL)&lat=\(lat.round(to: 1))&lon=\(lon.round(to: 1))"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        print("Requesting...")
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url, completionHandler: handle(data:response:error:))
            task.resume()
        }
        
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print("Sending error to delegate...")
            self.delegate?.didFailWithError(error: error!)
            return
        }
        
        if let safeData = data {
//            let dataString = String(data: safeData, encoding: .utf8)
//            print(dataString!)
            print("Handler...")
            if let weather = self.parseJSON(weatherData: safeData){
                print("Back to delegate...")
                self.delegate?.didUpdateWeather(self, weather: weather)
            }
        }
        
    }
    
    func parseJSON(weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    
}

extension Double {
    public mutating func round(to places: Int) -> Double {
        let precisionNumber = pow(10, Double(places))
        var n = self
        n = n * precisionNumber
        n.round()
        n = n / precisionNumber
        return n
    }
}
