//
//  AccountVC.swift
//  SurveyDataCollector
//
//  Created by Dominik Huffield on 5/3/21.
//

import UIKit

class AccountVC: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logout(_ sender: Any) {
        var sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var vc = sb.instantiateViewController(withIdentifier: "Login") as! ViewController
        present(vc, animated: true, completion: nil)

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
