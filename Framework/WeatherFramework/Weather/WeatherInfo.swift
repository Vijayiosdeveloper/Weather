//
//  WeatherInfo.swift
//  Weather
//
//  Created by Vijay Thota on 1/31/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

class WeatherInfo {
    var humidity : Int
    var pressure : Int
    var temparature : Float
    var tempMax : Float
    var tempMin : Float
    var descLinkStr: String
    var descMain : String
    var sunrise : String
    var sunset : String
    var windSpeed : String
    var WindDeg : String

    init (humidity: Int, pressure: Int, temparature: Float, tempMax: Float, tempMin: Float, descLinkStr: String, descMain: String, sunrise: String, sunset: String, windSpeed: String, windDeg: String) {
        self.humidity = humidity
        self.pressure = pressure
        self.temparature = temparature
        self.tempMax = tempMax
        self.tempMin = tempMin
        self.descLinkStr = descLinkStr
        self.descMain = descMain
        self.sunrise = sunrise
        self.sunset = sunset
        self.windSpeed = windSpeed
        self.WindDeg = windDeg
    }
    
    var dictionaryWeatherInfo : [String : AnyObject] {
        var objDict : [String : Any]!
        objDict["humidity"] = humidity
        objDict["pressure"] = self.pressure
        objDict["temparature"] = self.temparature
        objDict["tempMax"] = self.tempMax
        objDict["tempMin"] = self.tempMin;
        
        return objDict! as [String : AnyObject];
    }
    
    class func convertWeatherInfoArrayToDictionary(arrayWeatherInfo : [WeatherInfo]) -> Dictionary<String,AnyObject> {
        var arrayWeatherInfoDictionaries : Array<Dictionary<String,AnyObject>> = Array()
        for obj in arrayWeatherInfo {
            arrayWeatherInfoDictionaries.append(obj.dictionaryWeatherInfo);
        }
        return ["weatherInfo" : arrayWeatherInfoDictionaries as AnyObject];
    }


}
