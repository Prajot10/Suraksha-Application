//
//  EmailManager.swift
//  SuRaKsHa App
//
//  Created by Prajot Awale on 19/05/24.
//

/*import Foundation
import UIKit
import Firebase

 protocol EmailManagerDelegate {
     func didUpdateEmail(_ emailManager: EmailManager, details: DetailModel)
     func didFailWithError(error: Error)
 }

class EmailManager {
    
    let db = Firestore.firestore()
    var ref = DatabaseReference.init()
    var delegate: EmailManagerDelegate?
    var details = [DetailModel]()
    
    init(){
        getEmailData()
    }
    
    
 func getEmailData(){
     self.ref.child(K.FStore.collectionName).queryOrderedByKey().observe(.value) { (snapshot) in
         self.details.removeAll()
         if let snapshot = snapshot.children.allObjects as? [DataSnapshot]{
             for snap in snapshot{
                 if let mainDict = snap.value as? [String: AnyObject]{
                     let userEmail = mainDict["userEmail"] as? String
                     let guardianEmail = mainDict["guardianEmail"] as? String
                     self.details.append(DetailModel(userEmail: userEmail!, guardianEmail: guardianEmail!))
                     
                     
                     
                     
             
                 }
             }
         }
     }
     
 }

    
}*/



