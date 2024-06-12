//
//  LoginVC.swift
//  SuRaKsHa App
//
//  Created by Prajot Awale on 03/05/24.
//

import UIKit
import FirebaseAuth

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        

        
        
    }
    
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
                    
                    Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                        if let e = error {
                            print(e.localizedDescription)
                        } else {
                            self.performSegue(withIdentifier: K.loginSegue, sender: self)
                        }
                    }
            }
        
        
    }
    
}
