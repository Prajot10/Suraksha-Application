//  MainVC.swift
//  SuRaKsHa App
//  Created by Prajot Awale on 03/05/24.

import UIKit
import CoreLocation
import Firebase
import SwiftUI
import MessageUI


class MainVC: UIViewController, CLLocationManagerDelegate {
    
    
    
    @IBOutlet weak var userEmailLabel: UILabel!
    
    @IBOutlet weak var guardianEmailLabel: UILabel!
    
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
     

    @IBAction func SosPressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: K.EndinSegue, sender: self)

    }
    
    
}
