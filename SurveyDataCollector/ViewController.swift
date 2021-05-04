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
            
//            let email = "Trevor"
//            usersFetch.predicate = NSPredicate(format: "email == %@", email)

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
        var signup_list: [String?] = [add_email.text, add_user.text, add_pass.text, add_pass_copy.text]
        var persist: Bool = true
        for val in signup_list {
            if val! == "" {
                print("add input for -----------\t")
                persist = false
            }
        }
        if signup_list[2]! != signup_list[3]! {
            
        } else if isNewEmail(email: signup_list[0]!) && persist {
            let new_user = User(context: context)
            new_user.email = signup_list[0]!
            new_user.username = signup_list[1]!
            new_user.password = signup_list[2]!
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
    
//    func login (name: String, password: String) {
//
//    }
    
    func fetchUsers() {
//        context.f
    }
}

