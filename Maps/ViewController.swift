//
//  ViewController.swift
//  Maps
//
//  Created by Kevin Le on 3/5/17.
//  Copyright © 2017 Kevinvle. All rights reserved.
//

import UIKit
import MapKit // importing map kit to use map related functions

class ViewController: UIViewController, MKMapViewDelegate { // Add MKMap* to allow view controller to control map
    
    @IBOutlet var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let latitude: CLLocationDegrees = 27.1
        
        let longitude: CLLocationDegrees = 78.0
        
        let latDelta: CLLocationDegrees = 0.05 // zoom or zoon level of the map. 0.05 is a reasonable start
        
        let lonDelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

