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
        
        let beaconRegion = CLBeaconRegion(proximityUUID: UUID(uuidString: "74278BDA-B644-4520-8F0C-720EAF059935")!, major: 5, identifier: "TestBeacon")
        locationManager.startMonitoring(for: beaconRegion)
        //locationManager.startRangingBeacons(in: beaconRegion)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        for beacon in beacons {
            let major = beacon.major
            let minor = beacon.minor
            let uuid = beacon.proximityUUID
            print("Ranged a beacon: Maj \(major), minor: \(minor), uuid: \(uuid)")
            /*
            let rangedBeacon: PFObject = PFObject(className: "RangedBeacons")
            rangedBeacon["Major"] = major.intValue
            rangedBeacon["Minor"] = minor.intValue
            rangedBeacon["UUID"] = uuid.uuidString
            
            rangedBeacon.saveInBackground { (done, error) in
                if error != nil {
                    print(error?.localizedDescription)
                }
            }
            */
        }
     */
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

