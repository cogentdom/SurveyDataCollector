//
//  StarVC.swift
//  SurveyDataCollector
//
//  Created by Dominik Huffield on 5/3/21.
//

import UIKit

class StarVC: UIViewController {
    
    @IBOutlet weak var stars: CosmosView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        stars.rating
        var x = stars.rating
        stars.settings.fillMode = .half
        stars.settings.starMargin = 10
//        stars.didFinishTouchingCosmos
    }
    


}
