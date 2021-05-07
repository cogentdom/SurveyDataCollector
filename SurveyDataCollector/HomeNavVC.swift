//
//  HomeVC.swift
//  SurveyDataCollector
//
//  Created by Dominik Huffield on 5/7/21.
//

import UIKit

class HomeNavVC: UINavigationController {
    var username: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(username)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.destination is AccountVC {
            let vc = segue.destination as? AccountVC
            vc?.username = username
        }
    }
    
//    @IBSegueAction func accountSegue(_ coder: NSCoder) -> AccountVC? {
//        AccountVC.username.va = username
//        return AccountVC()
//    }
    
}
