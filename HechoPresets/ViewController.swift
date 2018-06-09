//
//  ViewController.swift
//  HechoPresets
//
//  Created by Максим Белугин on 01.06.2018.
//  Copyright © 2018 Максим Белугин. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showManual(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "man") as! ManualController
        self.present(vc, animated: true)
    }
    
}

