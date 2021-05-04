//
//  ViewController.swift
//  SurveyDataCollector
//
//  Created by Dominik Huffield on 5/3/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
//    ------------
    @IBOutlet weak var add_email: UITextField!
    @IBOutlet weak var add_user: UITextField!
    @IBOutlet weak var add_pass: UITextField!
    @IBOutlet weak var add_pass_copy: UITextField!
    
    
//    ------------
    override func viewDidLoad() {
        super.viewDidLoad()

        if username.text != nil && password.text != nil {
            login(name: username.text!, password: password.text!)
        }
        
    }
    @IBAction func signUp(_ sender: Any) {
        var signup_list: [String?] = [add_email.text, add_user.text, add_pass.text, add_pass_copy.text]
        var persist: Bool = true
        for val in signup_list {
            if val == nil {
                print("add input for \(val)")
                persist = false
            }
        }
        if isNewEmail(email: signup_list[0]!) && persist {
            
        }
    }
    
    func isNewEmail (email: String) -> Bool {
        return true
    }
    
    func login (name: String, password: String) {
        
    }
}

