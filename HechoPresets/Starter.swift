//
//  Starter.swift
//  HechoPresets
//
//  Created by Максим Белугин on 04.06.2018.
//  Copyright © 2018 Максим Белугин. All rights reserved.
//

import UIKit

class Starter: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if isFirst {
            print("toManual")
            DispatchQueue.main.async(execute: {
                self.performSegue(withIdentifier: "toManual", sender: nil)
            })
            
            
        }
        else {
            print("toMain")
            DispatchQueue.main.async(execute: {
                self.performSegue(withIdentifier: "toMain", sender: nil)
            })
            
        }
        
        // Do any additional setup after loading the view.
    }



}
