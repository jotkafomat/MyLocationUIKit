//
//  LocationsViewController.swift
//  MyLocationUIKit
//
//  Created by Krzysztof Jankowski on 02/09/2021.
//

import UIKit
import CoreData
import CoreLocation

class LocationsViewController: UITableViewController {
    
    var managedObjectContext: NSManagedObjectContext!
    
    lazy var fetchedResultsController: NSFetchedResultsController<Location> = {
      let fetchRequest = NSFetchRequest<Location>()

      let entity = Location.entity()
      fetchRequest.entity = entity

      let sortDescriptor = NSSortDescriptor(
        key: "date",
        ascending: true)
      fetchRequest.sortDescriptors = [sortDescriptor]

      fetchRequest.fetchBatchSize = 20

      let fetchedResultsController = NSFetchedResultsController(
        fetchRequest: fetchRequest,
        managedObjectContext: self.managedObjectContext,
        sectionNameKeyPath: nil,
        cacheName: "Locations")

      fetchedResultsController.delegate = self
      return fetchedResultsController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
          performFetch()
 
    }    
    // MARK: - Table View Delegates
    override func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
          return sectionInfo.numberOfObjects
    }
    
    override func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "LocationCell",
            for: indexPath) as! LocationCell

          let location = fetchedResultsController.object(at: indexPath)
          cell.configure(for: location)
        
        return cell
    }
    
    override func tableView(
      _ tableView: UITableView,
      commit editingStyle: UITableViewCell.EditingStyle,
      forRowAt indexPath: IndexPath
    ) {
      if editingStyle == .delete {
        let location = fetchedResultsController.object(
          at: indexPath)
        managedObjectContext.delete(location)
        do {
          try managedObjectContext.save()
        } catch {
          print(error)
        }
      }
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "EditLocation" {
        let controller = segue.destination  as! LocationDetailsTableViewController
        controller.managedObjectContext = managedObjectContext

        if let indexPath = tableView.indexPath(
          for: sender as! UITableViewCell) {
          let location = fetchedResultsController.object(at: indexPath)
          controller.locationToEdit = location
        }
      }
    }
    
    // MARK: - Helper methods
    func performFetch() {
      do {
        try fetchedResultsController.performFetch()
      } catch {
        print(error)
      }
    }
    
    deinit {
      fetchedResultsController.delegate = nil
    }
}
