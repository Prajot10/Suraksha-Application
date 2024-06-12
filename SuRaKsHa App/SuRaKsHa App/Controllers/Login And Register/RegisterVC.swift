//
//  RegisterVC.swift
//  SuRaKsHa App
//
//  Created by Prajot Awale on 03/05/24.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterVC: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var guardianTextField: UITextField!
    
    let db = Firestore.firestore()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
                    Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                        
                        if let e = error {
                            print(e.localizedDescription)
                        }else{
                            self.performSegue(withIdentifier: K.registerSegue, sender: self)
                        }
                              
                    }
                }
        
        
        if let guardianEmail = guardianTextField.text , let userEmail = Auth.auth().currentUser?.email{
            db.collection(K.FStore.collectionName).addDocument(data: [K.FStore.userField:userEmail,K.FStore.guardianField: guardianEmail]) { error in
                if let e = error{
                    print("There is an issue adding data in to firestore, \(e)")
                }else {
                    print("Successfully Saved Data")
                    
                }
            }
            
        }
        
        
        }
    

    }
    



