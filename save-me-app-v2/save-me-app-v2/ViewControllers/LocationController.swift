//
//  LocationController.swift
//  SaveMe
//
//  Created by Adel Janahi on 12/22/19.
//  Copyright © 2019 BahrainPolytechnic. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class LocationController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    
    static var confirmedAddress: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    @IBAction func Locate(_ sender: Any) {        
    let userLocation = mapView.userLocation
    
    let region = MKCoordinateRegion(center: (userLocation.location?.coordinate)!, latitudinalMeters: 1000, longitudinalMeters: 1000)
    
    mapView.setRegion(region, animated: true)
    
    var longitude: CLLocationDegrees = (self.locationManager.location?.coordinate.longitude)!
    
    var latitude: CLLocationDegrees = (self.locationManager.location?.coordinate.latitude)!
    
    var location = CLLocation(latitude: latitude, longitude: longitude)
    
    CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
        
        if error != nil {
            print("failed")
            return
        }
        
        if (placemarks?.count)! > 0 {
            
            let pm = placemarks?[0]
            
            let address = (pm?.subThoroughfare)! + " " + (pm?.thoroughfare)! + (pm?.locality)! + "," + (pm?.administrativeArea)! + " " + (pm?.postalCode)! + " " + (pm?.isoCountryCode)!
            
            print(address)
            LocationController.confirmedAddress = address
        } else {
            
            print("Error")
        }
        
    })
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        mapView.centerCoordinate = userLocation.location!.coordinate
    }
}
