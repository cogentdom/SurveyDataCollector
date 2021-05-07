//
//  ViewController.swift
//  SurveyDataCollector
//
//  Created by Dominik Huffield on 5/3/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    // Instantiation of database container
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    /*
     --------------------------
     --- Function for Login button, includes validation and navigates if successful
     --------------------------
     */
    @IBAction func login(_ sender: Any) {
        var persist: Bool = true
        password.layer.borderWidth = 0
        username.layer.borderWidth = 0
        /*
         --------------------------
         --- Validations for whether the fields have entries
         --------------------------
         */
        if username.text! == "" && password.text! == "" {
            for val in [username!, password!] {
                val.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.1, alpha: 1.0).cgColor
                val.layer.borderWidth = 3.0
                val.layer.cornerRadius = 5
                persist = false
            }
        } else if username.text! == "" {
            var val = username
            val?.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.1, alpha: 1.0).cgColor
            val?.layer.borderWidth = 3.0
            val?.layer.cornerRadius = 5
            persist = false
        } else if password.text! == ""{
            var val = password
            val?.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.1, alpha: 1.0).cgColor
            val?.layer.borderWidth = 3.0
            val?.layer.cornerRadius = 5
            persist = false
        }
        
        /*
         --------------------------
         --- Validation for whether those fields are correct
         --------------------------
         */
        if persist {
            let usersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
//            try context.delete(<#NSManagedObject#>)
            do {
                usersFetch.predicate = NSPredicate(format: "username == %@", username.text!)
                let fetchedUsers = try context.fetch(usersFetch) as! [User]

//                print(fetchedUsers.description)
                if fetchedUsers.count == 0 {
                    var val = username
                    val?.layer.borderColor = UIColor(red: 0.1, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
                    val?.layer.borderWidth = 3.0
                    val?.layer.cornerRadius = 5
                } else if fetchedUsers[0].password != password.text! {
                    var val = password
                    val?.layer.borderColor = UIColor(red: 0.1, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
                    val?.layer.borderWidth = 3.0
                    val?.layer.cornerRadius = 5
                } else {
                    var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    
                    var vc = sb.instantiateViewController(withIdentifier: "Home") as! HomeVC
                    present(vc, animated: true, completion: nil)
                }

            } catch {
                fatalError("Failed to fetch employees: \(error)")
            }
        }
        
        
        
//        if username.text! == "" || password.text! == "" {
//        let usersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
//
//        do {
//            let fetchedUsers = try context.fetch(usersFetch) as! [User]
//            print(fetchedUsers)
//        } catch {
//            fatalError("Failed to fetch employees: \(error)")
//        }
//        } else {
//            print("entered username: \(username.text!)")
//        }
    }

    
}

