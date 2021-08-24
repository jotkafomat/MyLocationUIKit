//
//  CurrentLocationViewController.swift
//  MyLocationUIKit
//
//  Created by Krzysztof Jankowski on 24/08/2021.
//

import UIKit

class CurrentLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    //    MARK: - Outlets
        @IBOutlet var messageLabel: UILabel!
        @IBOutlet var latitudeLabel: UILabel!
        @IBOutlet var longitudeLabel: UILabel!
        @IBOutlet var addressLabel: UILabel!
        @IBOutlet var tagButton: UIButton!
        @IBOutlet var getButton: UIButton!
    
//    MARK: -Actionc
    
    @IBAction func getLocation() {
        
    }
}

