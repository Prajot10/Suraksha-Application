//
//  EndVC.swift
//  SuRaKsHa App
//
//  Created by Prajot Awale on 04/05/24.
//

import UIKit
import MapKit
import CoreLocation
import Firebase
import MessageUI


class EndVC: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var mapView : MKMapView!
    
    var locationManager: CLLocationManager = {
        var manager = CLLocationManager()
        manager.distanceFilter = 10
        manager.desiredAccuracy = kCLLocationAccuracyBest
        return manager
    }()
    
    let db = Firestore.firestore()
    var details : [DetailModel] = []
    
    var UE = Auth.auth().currentUser?.email
    
    
    
    var GEmail : String = ""
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "MAP"
        
        
        let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.black]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        
        navigationItem.hidesBackButton = true
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        updatelocationonMap(to: locationManager.location ?? CLLocation(), with: "You Location")
        
        
        
        
        
        
        
        
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if (status == .authorizedWhenInUse || status == .authorizedAlways ){
            locationManager.startUpdatingLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
            
            db.collection(K.FStore.collectionName)
                .addSnapshotListener { [self] (QuerySnapshot, error) in
                
                self.details = []
                self.GEmail = ""
                
                    if let e = error {
                        print("There was an issue in retriveting data from firestore.\(e)")
                    }else{
                        print("Data Retrived")
                        if let snapshotDocument = QuerySnapshot?.documents {
                            for doc in snapshotDocument {
                                
                                let data = doc.data()
                                
                                if UE == data[K.FStore.userField] as? String, let GuardianEmail = data[K.FStore.guardianField] as? String{
                                    
                                    let newDetails = DetailModel(userEmail: UE, guardianEmail: GuardianEmail)
                                    self.details.append(newDetails)
                                    
                                    GEmail = newDetails.guardianEmail!
                                    
                                    print(newDetails.userEmail!)
                                    print(GEmail)
                                    
                                    
                                    
                    

                                }
                            }
                        }
                    }
                    
            
            if let location = locations.last {
                locationManager.stopUpdatingLocation()
                let lat = location.coordinate.latitude
                let lon = location.coordinate.longitude
                
                guard MFMailComposeViewController.canSendMail() else{
                    return
                }
                
                
                let composer = MFMailComposeViewController()
                composer.mailComposeDelegate = self
                composer.setToRecipients([GEmail])
                composer.setSubject(K.FStore.msg)
                composer.setMessageBody("https://maps.google.com/?q=@\(lat),\(lon)", isHTML: false)
                
                present(composer, animated: true)
            }
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    
    func updatelocationonMap(to location: CLLocation, with title: String?) {
        let point = MKPointAnnotation()
        point.title = title
        point.coordinate = location.coordinate
        //self.mapView.removeAnnotations((self.mapView.annotations as! MKAnnotation) as! [any MKAnnotation])
        self.mapView.addAnnotation(point)
        
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 100, longitudinalMeters: 100)
        self.mapView.setRegion(region, animated: true)
        
    }
    
    
    /*func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        
        controller.dismiss(animated: true, completion: nil)
    }*/
    
    
    
    @IBAction func locationButtonPressed(_ sender: UIButton) {
        
        updatelocationonMap(to: locationManager.location ?? CLLocation(), with: "Your Location")
        
        
        
    }
        
}

extension EndVC : MFMailComposeViewControllerDelegate {
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: (any Error)?) {
        
        controller.dismiss(animated: true, completion: nil)
    }
}









    
    
    
    
    
    
    

    
    
    
    

