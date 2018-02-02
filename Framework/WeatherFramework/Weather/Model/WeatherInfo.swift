//
//  MyModule.swift
//  Weather
//
//  Created by Vijay Thota on 2/1/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

// Model class for holding the Weather Information

public struct WeatherInfo {
    // public ivars
    public let name: String
    public let shotDesc: String
    public let longDesc: String
    public let icon: String
    public let windSpeed: Float
    public let sunset: String
    public let sunrise: String
}

extension WeatherInfo {
    // Initializer method with supplied json object
    init?(json: [String: Any]) {
        print("Enterd into json parsing = \(json)")
        
        // Extract name
        guard let name = json["name"] as? String else {
            return nil
        }
        
        // Extract main dictionary
        let weatherArray: [Any] = json["weather"] as! Array
        let weatherDict: [String: Any] = weatherArray.first as! [String : Any]
        guard let shortDesc = weatherDict["main"] as? String else {
            return nil
        }

        // Extract description
        guard let longDesc = weatherDict["description"] as? String else {
            return nil
        }
        
        // Extract Icon
        guard let icon = weatherDict["icon"] as? String else {
            return nil
        }
        
        // Extract Wind Dictionary
        let windDict: [String: Any] = json["wind"] as! [String: Any]
        
        // Extract Wind Speed
        guard let windSpeed = windDict["speed"] as? Float else {
            return nil
        }

        // Extract Sys Dictionary
        let sysDict : [String: Any] = json["sys"] as! [String: Any]
        
        
        // Date Formatter object to convert the Date into hh:mm a
        let dayTimePeriodFormatter = DateFormatter()
        dayTimePeriodFormatter.dateFormat = "hh:mm a"

        // Extract Sunrise
        guard let sunrise = sysDict["sunrise"] as? Int else {
            return nil
        }
        
        let date1 = NSDate(timeIntervalSince1970: TimeInterval(sunrise))
        let dateStringSunrise = dayTimePeriodFormatter.string(from: date1 as Date)

        // Extract Sunset
        guard let sunset = sysDict["sunset"] as? Int else {
            return nil
        }
        
        // Converting Unix time to Date
        let date = NSDate(timeIntervalSince1970: TimeInterval(sunset))
        let dateString = dayTimePeriodFormatter.string(from: date as Date)
        
        // Setting the ivars
        self.name = name
        self.shotDesc = shortDesc
        self.longDesc = longDesc
        let imageURL = "http://openweathermap.org/img/w/\(icon).png"
        self.icon = imageURL
        self.windSpeed = windSpeed
        self.sunset = dateString
        self.sunrise = dateStringSunrise
    }
    
    init() {
        self.name = ""
        self.shotDesc = ""
        self.longDesc = ""
        self.icon = ""
        self.windSpeed = 0.0
        self.sunset = ""
        self.sunrise = ""
    }
    
}
