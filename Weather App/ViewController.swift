//
//  ViewController.swift
//  Weather App
//
//  Created by Richard Lichkus on 6/3/14.
//  Copyright (c) 2014 Richard Lichkus. All rights reserved.
//

import UIKit
import CoreLocation
import MobileCoreServices

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var imgBackground : UIImageView
    @IBOutlet var lblWeather : UILabel
    @IBOutlet var btnRefreshWeather : UIButton
    @IBOutlet var lblCurrentLocation : UILabel
    @IBOutlet var lblLastUpdated : UILabel
    @IBOutlet var lblHighLow : UILabel
    
// ============= Constants and Variables
    
    let urlPath = "http://api.openweathermap.org/data/2.5/weather?q=Seattle"
    var data : NSMutableData = NSMutableData()
    var weatherData : Weather = Weather()
    
// ============= Methods
    
    @IBAction func pressedRefreshWeather(sender : AnyObject) {
        
        getWeatherForSearch("seattle")
        
        lblWeather.text = "The weather is amazing today."
        var currentDate : NSDate = NSDate(timeIntervalSinceNow: 0)
        lblLastUpdated.text = "Last updated: " + currentDate.description
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblCurrentLocation.text = "Zipcode: 98101"
        imgBackground.image = UIImage(named: "seattle")
    }
    
    override func viewWillAppear(animated: Bool){
        // Location Manager
        
        var locationManager : CLLocationManager = CLLocationManager()
        let status = CLLocationManager.authorizationStatus()
        if (status == CLAuthorizationStatus.NotDetermined){
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.delegate = self
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.startUpdatingLocation()
    }
    
// ============= Weather Network API Calls

    func getWeatherForSearch(searchTerm : String){
        
        var url : NSURL = NSURL(string: urlPath)
        var request : NSURLRequest = NSURLRequest(URL: url)
        var connection : NSURLConnection = NSURLConnection(request: request, delegate: self, startImmediately: true)
        connection.start()
    }
    
    func connection(_connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!) {
            
    }
    
    func connection(connection : NSURLConnection!, didReceiveData data:NSData!)
    {
        self.data.appendData(data)
        println("yoyo")
    }
    
    func connectionDidFinishLoading(connection : NSURLConnection!)
    {
        var err : NSError
        var JsonResult : NSDictionary = NSJSONSerialization.JSONObjectWithData(self.data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
        
        var temp = JsonResult["main"] as NSDictionary
        self.weatherData.kelvinHighTemp = temp["temp_max"] as Double
        self.weatherData.kelvinLoTemp = temp["temp_min"] as Double
        self.weatherData.cityName = JsonResult["name"] as String
        
        lblHighLow.text = "\(self.weatherData.farHighTemp)/ \(self.weatherData.farLoTemp)"
        lblCurrentLocation.text = self.weatherData.cityName
    }

// ============= Location Manager
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: AnyObject[]!){
        var location = locations[locations.endIndex] as CLLocation
        println(location)
    }
    
    
// ============= Memory

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

