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
    var cityName: String = ""
    
    init(){
        
    }
    
    var farHighTemp :Double {
        return Convert.tempature(kelvinHighTemp, inCelsius:nil, inFarenheit:nil).Farenheit
    }
    
    var farLoTemp :Double {
        return Convert.tempature(kelvinLoTemp, inCelsius:nil, inFarenheit:nil).Farenheit
    }
}