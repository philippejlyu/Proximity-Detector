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
        
        //Now we setup the beacon monitoring
        //Tell it what beacon we want to look for
        let beaconRegion = CLBeaconRegion(proximityUUID: UUID(uuidString: "74278BDA-B644-4520-8F0C-720EAF059935")!, major: 5, identifier: "TestBeacon")
        //Start monitoring for said beacon
        locationManager.startMonitoring(for: beaconRegion)
    }
    

    //MARK: - Core Location managing functions
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        if let region = region as? CLBeaconRegion {
            print("Region: \(region.proximityUUID)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, monitoringDidFailFor region: CLRegion?, withError error: Error) {
        if let region = region as? CLBeaconRegion {
            print("Region: \(region.proximityUUID)")
        }
    }
    /*
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Did enter region")
        if let beaconRegion = region as? CLBeaconRegion {
            print("Did enter region: Maj: \(beaconRegion.major), min \(beaconRegion.minor), uuid: \(beaconRegion.proximityUUID)")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Did exit region")
        if let beaconRegion = region as? CLBeaconRegion {
            print("Did exit region Maj: \(beaconRegion.major), min \(beaconRegion.minor), uuid: \(beaconRegion.proximityUUID)")
        }
    }
 */
}

