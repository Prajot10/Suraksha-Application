//
//  ViewController.swift
//  SuRaKsHa App
//
//  Created by Prajot Awale on 03/05/24.
//

import UIKit
import CoreLocation
import Firebase

class WelcomeVC: UIViewController, CLLocationManagerDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if Auth.auth().currentUser?.email != nil {
          // User is signed in.
            print(Auth.auth().currentUser?.email! as Any)
            self.performSegue(withIdentifier: K.mainSegue, sender: self)
        } else {
          // No user is signed in.
            self.performSegue(withIdentifier: K.tologin, sender: self)
        }
        
    }
    
    
    @IBAction func toLoginPressed(_ sender: UIButton) {
        
        if Auth.auth().currentUser?.email != nil {
          // User is signed in.
            print(Auth.auth().currentUser?.email! as Any)
            self.performSegue(withIdentifier: K.mainSegue, sender: self)
        } else {
          // No user is signed in.
            self.performSegue(withIdentifier: K.tologin, sender: self)
        }
    }
    
    
}

