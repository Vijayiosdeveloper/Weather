//
//  Weather.swift
//  Weather
//
//  Created by Vijay Thota on 2/1/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

public class Weather : NSObject {
    // OpenWeather APPID
    static let appID = "3020479343f44c8f02cdbd2149132011"
    
    // Weather Instance
    static let sharedInstance: Weather = {
        let instance = Weather()
        // setup code
        return instance
    }()

    // Perform Weather search for the given location
    public func doWeatherSearch (location: String, withCompletion completion: @escaping (WeatherInfo) -> Void) {
        let serviceManager = WebServiceManager.sharedInstance
        let revisedLocation: String = location.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
        let urlStr = "http://api.openweathermap.org/data/2.5/weather?q=\(revisedLocation),us&appid=\(Weather.appID)"
        
        serviceManager.sendRequest(urlString: urlStr, withCompletion: { (data) -> Void in
            if ((data) != nil) {
                let dataObject: [String: Any] = data!
                print("JSON = \(dataObject) = \(dataObject["main"] ?? "Test")")
                
                let module = WeatherInfo(json: data!)!
                print("module = \(module)")
                completion(module)
            } else {
                let module = WeatherInfo()
                completion(module)
            }
        })
    }
}
