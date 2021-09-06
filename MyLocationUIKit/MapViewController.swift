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

  @IBAction func showLocations() {
  }
}

extension MapViewController: MKMapViewDelegate {
}
