//
//  
//  TestingCompass
//
//  Created by may on 2016-10-22.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit
import CoreLocation
//import CoreGraphics

struct LocationConstants {
//    lat = 21.422510   long = 39.826168
    
    static let Lattitude =  43.6532 * ( Double.pi / 180)
    static let Longitude = 79.3832 * ( Double.pi / 180)
}

class Compass: UIViewController, CLLocationManagerDelegate {
    
    
    let obj1 = CLLocationManager()
    var degrees: Double = 0
    var currentHeading: CLLocationDirection? = nil
    
    // MARK:
    // MARK: Outlets
    
    @IBOutlet weak var degOfTwoLoc: UILabel!
    
    @IBOutlet weak var findLocation: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lineImageView: UIImageView!
    @IBOutlet weak var magneticHeading: UILabel!
    
    
    // MARK:
    // MARK: Actions
    
    @IBAction  func cancel(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("disappeared")
    }
    
    // MARK:
    // MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        obj1.desiredAccuracy = kCLLocationAccuracyKilometer
        obj1.delegate = self
        
        if(CLLocationManager.locationServicesEnabled()){
            //Check if User has enabled Location Services
//            print("Are here 1")
            if (CLLocationManager.headingAvailable()){
                //Check if iphone has heading to get compass direction
                
//                print("Are here 2")
                obj1.desiredAccuracy = kCLLocationAccuracyBest
                obj1.startUpdatingHeading() //Get the heading
                obj1.requestLocation() // Get the location
                obj1.requestWhenInUseAuthorization()
            }
        } else {
//            print("Are here 3")
            //Ask the user re-authorize
            obj1.requestWhenInUseAuthorization()
            obj1.requestLocation()
        }
    }
    
    //##  This function will convert from Deg to Rad ##
    func toRad(value: Double) -> Double {
        return (value * (Double.pi / 180))
    }
    
    
    // ## This Function will rotate the compass needle ##
    func updateHeadingDisplay(){
//        print("Inside the transform the needle")
        UIView.animate(withDuration: 0.6, delay: 0.0, options: [.beginFromCurrentState, .curveEaseOut, .allowUserInteraction]  , animations: {
            
            let thisV = CGFloat(self.toRad(value: self.degrees) - (self.toRad(value: self.currentHeading!)))
            
            self.lineImageView.transform = CGAffineTransform(rotationAngle: thisV)
            
        }) { (finished) in
        }
    }
    
    // ## THis function is used to get the Bearing (Degree of the direction between
    // city and current location
    func timeToGetTheDirection(location: CLLocation)  {
//        print("Getting current direction to find bearing degree")
        // Current Location Lat & Long converted to Rad
        
        let lat1InRad = toRad(value: location.coordinate.latitude)
        let long1InRad = toRad(value: location.coordinate.longitude)
        
        // Display Lat & Long on the screen
        
//        lat.text = String((lat1InRad * 10000).rounded(.up) / 10000)
//        long.text = String((long1InRad * 10000).rounded(.up) / 10000)
        
        
        // Detala of the 2 values
        
        let differenceInLong = LocationConstants.Longitude - long1InRad
        
        // sin and cos for X & Y
        
        let x = sin(differenceInLong) * cos(LocationConstants.Lattitude)
        let y = cos(lat1InRad) * sin(LocationConstants.Lattitude) - sin(lat1InRad) * cos(LocationConstants.Lattitude) * cos(differenceInLong)
        
        // atan2 Formula converted to Degree
        
        var theAngleDeg = atan2(x, y) * (180 / Double.pi)
        
        //let newValue = Int(theAngleInRad.truncatingRemainder(dividingBy: 360))
        
        theAngleDeg += 360
        theAngleDeg = theAngleDeg > 360 ? (theAngleDeg-360) : theAngleDeg
        
        degrees = theAngleDeg
    }
    
    // MARK: - LocationManager Delegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        //print("what is the value1")
        print("recieve newHeading")
        var rad = newHeading.trueHeading > 0 ? newHeading.trueHeading : newHeading.magneticHeading
        currentHeading = newHeading.trueHeading > 0 ? newHeading.trueHeading : newHeading.magneticHeading
        
        findLocation.text = String(Double(round(1000*newHeading.trueHeading)/1000))
        
        
        rad *= (Double.pi / 180) //Convert it to Rad
        
        //print("True Heading in Rad is \(rad)")
        
        magneticHeading.text = String(Double(round(1000*newHeading.magneticHeading)/1000))
        
        imageView.transform = CGAffineTransform(rotationAngle: CGFloat(-rad))
        
        degOfTwoLoc.text = String(Double(round(1000*degrees)/1000))
        
        updateHeadingDisplay()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Get the current location")
        //print("what is the value2")
        //currentHeading = locations.last!.coordinate
        
        timeToGetTheDirection(location: locations.last!)
        
        if currentHeading != nil {
            updateHeadingDisplay()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        //print("Error")
    }
    
    func locationManagerShouldDisplayHeadingCalibration(_ manager: CLLocationManager) -> Bool {
        return true
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            manager.startUpdatingLocation()
        }
    }
}

