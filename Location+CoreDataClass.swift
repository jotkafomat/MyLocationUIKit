//
//  Location+CoreDataClass.swift
//  MyLocationUIKit
//
//  Created by Krzysztof Jankowski on 01/09/2021.
//
//

import Foundation
import CoreData
import MapKit

@objc(Location)
public class Location: NSManagedObject, MKAnnotation {
    public var coordinate: CLLocationCoordinate2D {
      return CLLocationCoordinate2DMake(latitude, longitude)
    }

    public var title: String? {
      if locationDescription.isEmpty {
        return "(No Description)"
      } else {
        return locationDescription
      }
    }

    public var subtitle: String? {
      return category
    }
}
