//
//  MapViewController.swift
//  MyLocationUIKit
//
//  Created by Krzysztof Jankowski on 06/09/2021.
//

import Foundation
import UIKit
import MapKit
import CoreData

class MapViewController: UIViewController {
    @IBOutlet var mapView: MKMapView!
    
    var locations = [Location]()
    
    var managedObjectContext: NSManagedObjectContext!
    
    // MARK: - Actions
    @IBAction func showUser() {
        let region = MKCoordinateRegion(
            center: mapView.userLocation.coordinate,
            latitudinalMeters: 1000,
            longitudinalMeters: 1000)
        mapView.setRegion(
            mapView.regionThatFits(region),
            animated: true)
    }
    
    override func viewDidLoad() {
      super.viewDidLoad()
      updateLocations()
    }
    
    @IBAction func showLocations() {
    }
    // MARK: - Helper methods
    func updateLocations() {
        mapView.removeAnnotations(locations)
        
        let entity = Location.entity()
        
        let fetchRequest = NSFetchRequest<Location>()
        fetchRequest.entity = entity
        
        locations = try! managedObjectContext.fetch(fetchRequest)
        mapView.addAnnotations(locations)
    }
}

extension MapViewController: MKMapViewDelegate {
}
