//
//  ViewController.swift
//  MSLoadingHUD
//
//  Created by Marco Siino on 12/04/2020.
//  Copyright (c) 2020 Marco Siino. All rights reserved.
//

import UIKit
import MSLoadingHUD

class ViewController: UIViewController, Loadable {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func simulateTask() {
        showLoadingHUD(loadingMessage: "Loading...")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) { [weak self] in
            self?.hideLoadingHUD()
        }
    }

}

