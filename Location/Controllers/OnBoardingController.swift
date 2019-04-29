//
//  OnBoardingController.swift
//  Location
//
//  Created by Shafeer Puthalan on 28/04/19.
//  Copyright © 2019 Shafeer Puthalan. All rights reserved.
//

import UIKit
import CoreLocation

class OnBoardingController: UIViewController {

    @IBOutlet var stopButton: UIButton!
    @IBOutlet var startButton: UIButton!
    
    var apiClient = APIClient()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeUI()
        
    }
    func initializeUI() {
        stopButton.layer.addBorder(cornerRadius: stopButton.layer.frame.width/2, borderWidth: 1, borderColor: UIColor.darkGray.cgColor)
        startButton.layer.addBorder(cornerRadius: startButton.layer.frame.width/2, borderWidth: 1, borderColor: UIColor.darkGray.cgColor)
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        
        
    }
    
    func handleLocationUpdation(incomingLocation : CLLocation) {
        
        if Defaults.getUpdatedLocation() != nil {
            let currentLocation = Defaults.getUpdatedLocation()
            
            //Calculating Distance and Time
            let distance = round(incomingLocation.distance(from: currentLocation!))
            let elapsedTime = incomingLocation.timestamp.timeIntervalSince((currentLocation?.timestamp)!).mintutes()
            
            if distance >= 100 || elapsedTime >= 2 {
                updateServer(updateLocation: incomingLocation)
            }
        }
        else {
            updateServer(updateLocation: incomingLocation)
            
        }
    }
    
    func updateServer(updateLocation : CLLocation ) {
        Defaults.setUpdatedLocation(updatedLocation: updateLocation)
        let body = LocationModel(location: Location(lat: updateLocation.coordinate.latitude, lng: updateLocation.coordinate.longitude))
        let updateLocationRequest = UpdateLocationRequest(body: body.jsonObject!)
        apiClient.send(apiRequest: updateLocationRequest) { (isSuccess, error) in
            if isSuccess! {
                print("Successfullly updated")
            }
        }
    }

    
    @IBAction func startAction(_ sender: Any) {
        locationManager.startUpdatingLocation()
    }
    
    @IBAction func stopAction(_ sender: Any) {
        locationManager.stopUpdatingLocation()
        
    }
}
extension OnBoardingController : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        handleLocationUpdation(incomingLocation: locations.last!)
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Unable to get Location because of \(error.localizedDescription)")
    }
}
