//
//  LocationViewController.swift
//  180Samui
//
//  Created by JasonMac on 26/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import UIKit
import MapKit

class LocationViewController: UIViewController {

    @IBOutlet weak var locationDescription: UITextView!
    @IBOutlet weak private var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadLocationCoordinates()

        mapView.mapType = .hybridFlyover
        // Do any additional setup after loading the view.
        
        loadLocationText()
        
    }
    
    func loadLocationCoordinates() {
        
        // Location cordinates
        let latitude = 9.490867
        let longitude = 100.058247
        
        var location = CLLocationCoordinate2D()
        location.latitude = latitude
        location.longitude = longitude
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "180 Samui"
        mapView.addAnnotation(annotation)
        
        // Centre location
        let initialLocation = CLLocation(latitude: latitude, longitude: longitude)
        mapView.centerToLocation(initialLocation)
        
        // Zooming, so we don't zoom out too far:
        let samniCentre = CLLocation(latitude: 9.503057, longitude: 99.999705)
        let region = MKCoordinateRegion(
          center: samniCentre.coordinate,
          latitudinalMeters: 50000,
          longitudinalMeters: 50000)
        mapView.setCameraBoundary(
          MKMapView.CameraBoundary(coordinateRegion: region),
          animated: true)
        
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 100000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }
    
    func loadLocationText() {
        
        let locText = "\n180 is located in the Chaweng Noi hills on an estate of luxury villas called Sunrise Mountain.\n\nThe beautiful white sands of Chaweng Noi beach are directly opposite the road to the estate and an easy 5 minutes drive from the villa.\n\nThe famous beach towns of Chaweng and Lamai are around 10 minutes away.\n\nThe Royal Samui Golf Club is a 5 minute stroll, as are a sea view restaurant and convenience store.\n\nThe airport is only 15-20 minutes by car.\n\nKo Samui is a 1 hour flight from Bangkok and can also be reached with direct flights from Hong Kong, Singapore and Kuala Lumpur."
        
        locationDescription.text = locText
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 1000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
