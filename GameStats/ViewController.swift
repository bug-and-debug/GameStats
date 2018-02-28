//
//  ViewController.swift
//  GameStats
//
//  Created by Angular-Dev on 2/28/18.
//  Copyright © 2018 Hans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let dataManager = DataManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Test().run()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

