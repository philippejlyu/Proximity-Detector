//
//  ViewController.swift
//  ProximityDetector
//
//  Created by Philippe Yu on 2018-01-29.
//  Copyright © 2018 Philippe Yu. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    //MARK: - Properties
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.locationManager.delegate = self
        self.locationManager.requestAlwaysAuthorization()
        let status = UIApplication.shared.backgroundRefreshStatus
        switch status {
        case .available:
            print("Available")
        case .denied:
            print("Denied")
        default:
            print("Unavailable")
        }
        print(UIApplication.shared.backgroundRefreshStatus.rawValue)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let message = UserDefaults.standard.value(forKey: "beacon") {
            print(message)
        } else {
            print("Did not range beacons properly???")
        }
    }


}

