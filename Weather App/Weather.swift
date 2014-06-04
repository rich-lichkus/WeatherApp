//
//  Weather.swift
//  Weather App
//
//  Created by Richard Lichkus on 6/3/14.
//  Copyright (c) 2014 Richard Lichkus. All rights reserved.
//

import Foundation

class Weather {
    
    var kelvinHighTemp : Double = 0
    var kelvinLoTemp : Double = 0
    var cityName: String
    
    init(){
        cityName = ""
    }
    
    var farHighTemp :Double {
        get {
            return convertFromKelvinToFahrenheit(kelvinHighTemp)
        }
    }
    
    var farLoTemp :Double {
        get {
            return convertFromKelvinToFahrenheit(kelvinLoTemp)
        }
    }
    
    func convertFromKelvinToFahrenheit(kelvinTemp:Double) -> Double {
        return (Double(kelvinTemp) - 273.0)*1.8 + 32.0
    }
    
    
}