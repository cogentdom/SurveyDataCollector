//
//  SignupVC.swift
//  SurveyDataCollector
//
//  Created by Dominik Huffield on 5/3/21.
//

import UIKit
import CoreData

class SignupVC: UIViewController {
    @IBOutlet weak var add_email: UITextField! 
    @IBOutlet weak var add_user: UITextField!
    @IBOutlet weak var add_pass: UITextField!
    @IBOutlet weak var add_pass_copy: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // Instantiation of database container
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    /*
     --------------------------
     --- Function for SignUp button, includes validations of text fields & navigation after successful entry
     --------------------------
     */
    @IBAction func signUp(_ sender: Any) {
        var signup_list: [UITextField] = [add_email, add_user, add_pass, add_pass_copy]
        var persist: Bool = true
        /*
         --------------------------
         --- Series of test to validate text fields have acceptable values
         --------------------------
         */
        for val in signup_list {
            val.layer.borderWidth = 0
            if val.text! == "" { // Test to validate existing values for each field
                val.layer.borderColor = UIColor(red: 0.9, green: 0.1, blue: 0.1, alpha: 1.0).cgColor
                val.layer.borderWidth = 2.5
                val.layer.cornerRadius = 5
                print("add input for -----------\t")
                persist = false
            }
        }
        if signup_list[2].text! != signup_list[3].text! { // Test to validate password entries match
            for val in [signup_list[2], signup_list[3]] {
                val.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.1, alpha: 1.0).cgColor
                val.layer.borderWidth = 3.0
                val.layer.cornerRadius = 5
                persist = false
            }
        }
        if !(isValidEmail(stringValue: signup_list[0].text!)) { // Test to validate email address is real
            let val = signup_list[0]
            val.layer.borderColor = UIColor(red: 0.1, green: 0.1, blue: 0.9, alpha: 1.0).cgColor
            val.layer.borderWidth = 2.5
            val.layer.cornerRadius = 5
            print("Incorrect email input -----------\t")
            persist = false
        }
        if !isNewEmail(email: signup_list[0].text!) { // Test to validate no accounts exist for that email address
            let val = signup_list[0]
            val.layer.borderColor = UIColor(red: 0.5, green: 0.1, blue: 0.9, alpha: 1.0).cgColor
            val.layer.borderWidth = 2.5
            val.layer.cornerRadius = 5
            print("Email input already exists -----------\t")
            persist = false
        }
        /*
         --------------------------
         --- Saves new user and opens Login page
         --------------------------
         */
        if persist { // Opens if all fields are filled in correctly
            let new_user = User(context: context)
            new_user.email = signup_list[0].text!
            new_user.username = signup_list[1].text!
            new_user.password = signup_list[2].text!
            do {
                try context.save()
            } catch {
                fatalError("Failed to save new user: \(error)")
            }
            
            var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            var wel = sb.instantiateViewController(withIdentifier: "Login") as! ViewController
            present(wel, animated: true, completion: nil)
        }
    }
    
    // MARK: - Utility functions for VC
    /*
     --------------------------
     --- Utility function to validate email format
     --------------------------
     */
    func isValidEmail(stringValue: String) ->Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: stringValue)
    }
    
    /*
     --------------------------
     --- Utility function to validate email isn't already assigned to an account
     --------------------------
     */
    func isNewEmail (email: String) -> Bool {
        let usersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        usersFetch.predicate = NSPredicate(format: "email == %@", email)
        
        do {
            let fetchedUsers = try context.fetch(usersFetch) as! [User]
            if fetchedUsers.count == 0 {
                return true
            } else {
                return false
            }
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }


}
