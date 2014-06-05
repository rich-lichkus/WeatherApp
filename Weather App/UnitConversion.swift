//
//  UnitConversion.swift
//  Weather App
//
//  Created by Richard Lichkus on 6/4/14.
//  Copyright (c) 2014 Richard Lichkus. All rights reserved.
//

import Foundation

class Convert{
    
    class func tempature(inKelvin:Double?,inCelsius:Double?,inFarenheit:Double?) -> (Kelvin:Double, Celsius:Double, Farenheit:Double)
    {
        var kelvin: Double = 0
        var celsius: Double = 0
        var farenheit: Double = 0
        
        if let k = inKelvin {
            kelvin = k
            celsius = k-273.0;
            farenheit = celsius*1.8 + 32.0
        } else if let c = inCelsius {
            celsius = c
            kelvin = c+273.0;
            farenheit = c*1.8 + 32.0
        } else if let f = inFarenheit {
            farenheit = f
            celsius = (f-32)/1.8
            kelvin = celsius+273.0;

        }
        return (kelvin, celsius, farenheit)
    }

}
