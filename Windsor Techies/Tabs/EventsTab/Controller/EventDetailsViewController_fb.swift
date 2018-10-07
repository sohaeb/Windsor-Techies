//
//  EventDetailsViewController.swift
//  UWindsor Msa
//
//  Created by may on 2016-09-22.
//  Copyright © 2016 sohaeb. All rights reserved.
//

import UIKit
import MapKit

class EventDetailsViewController_fb: UIViewController {
    
    var value: String? = nil
    var lat: Double? = nil
    var long: Double? = nil
    var imageOfEvent: UIImage?
    var name: String?
    var noLocation: Bool?
    var nameOfTheEvent: String?
    
    @IBOutlet weak var nameOfEvent: UILabel!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var descriptionOutlet: UILabel!
    
    func centerMapOnLocation(location: CLLocation) {
        
        if (noLocation)! {
            let regionRadius: CLLocationDistance = 7000
            
            //MKCoordinateRegionM
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
        } else {
            let regionRadius: CLLocationDistance = 1500
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        //mapView.setRegion(coordinateRegion, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let something = CLLocation(latitude: (lat!), longitude: (long!))
        
        centerMapOnLocation(location: something)
        self.navigationItem.title = name
        
        //if let value = value {
        descriptionOutlet.text = value
        //}
        
        if let name = nameOfTheEvent {
            nameOfEvent.text = name
        }
        
        if let imageOfEvent = imageOfEvent {
            imageOutlet.image = imageOfEvent
        }
    }
}
