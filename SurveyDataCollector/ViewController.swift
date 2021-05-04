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
    
//    ------------
    @IBOutlet weak var add_email: UITextField!
    @IBOutlet weak var add_user: UITextField!
    @IBOutlet weak var add_pass: UITextField!
    @IBOutlet weak var add_pass_copy: UITextField!
    
    
//    ------------
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func login(_ sender: Any) {
        if username.text! == "" || password.text! == "" {
            let usersFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "User")

            do {
                let fetchedUsers = try context.fetch(usersFetch) as! [User]
                print(fetchedUsers)
            } catch {
                fatalError("Failed to fetch employees: \(error)")
            }
        } else {
            print("entered username: \(username.text!)")
        }
    }
    
    @IBAction func signUp(_ sender: Any) {
        var signup_list: [UITextField] = [add_email, add_user, add_pass, add_pass_copy]
        var persist: Bool = true
        for val in signup_list {
            if val.text! == "" {
                val.layer.borderColor = UIColor(red: 0.9, green: 0.1, blue: 0.1, alpha: 1.0).cgColor
                val.layer.borderWidth = 2.5
                val.layer.cornerRadius = 5
                print("add input for -----------\t")
                persist = false
            }
        }
        if signup_list[2].text! != signup_list[3].text! {
            for val in [signup_list[2], signup_list[3]] {
                val.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.1, alpha: 1.0).cgColor
                val.layer.borderWidth = 3.0
                val.layer.cornerRadius = 5
            }
        } else if isNewEmail(email: signup_list[0].text!) && persist {
            let new_user = User(context: context)
            new_user.email = signup_list[0].text!
            new_user.username = signup_list[1].text!
            new_user.password = signup_list[2].text!
        }
    }
    
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

