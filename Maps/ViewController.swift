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
        
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: coordinates, span: span)
        
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation() // Going to have annotations on my map
        
        annotation.title = "Parking Spot 1 "
        
        annotation.subtitle = "Let's go!"
        
        annotation.coordinate = coordinates
        
        map.addAnnotation(annotation)
        
        let uilpgr = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longPress(gestureRecognizer:))) // UI long press gesture recognizer; target is view controller. starting with action: #selector***, we get new syntax because of xcode 8. We access longpress method through view controller
        
        uilpgr.minimumPressDuration = 0.5
        
        map.addGestureRecognizer(uilpgr)
        
    }
    
    func longPress(gestureRecognizer: UIGestureRecognizer) { // We want this method to receive a variable called gestureRecognizer and this is going to have type: UIGestureRecognizer. The colon in "longpress:" is important because the information can get sent and receive it in the variable
        
        if gestureRecognizer.state == .ended { // Check state of gesture, looking for the end or beginning of touch gesture
        
        let touchPoint = gestureRecognizer.location(in: self.map) // Using self.map because we're in a closure
        
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map) // From the map, convert our touchPoint to toCoordinateFrom from the map. The map does that converting for us because the map knows where the gesture was - where the long press happened and where that is in terms of the coordinate space
        
        let annotation = MKPointAnnotation()
        
        annotation.coordinate = coordinate
        
        annotation.title = "New place"
        
        annotation.subtitle = "Maybe I'll go here too..."
        
        map.addAnnotation(annotation)
        
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

