//
//  GiftController.swift
//  HechoPresets
//
//  Created by Максим Белугин on 03.06.2018.
//  Copyright © 2018 Максим Белугин. All rights reserved.
//

import UIKit

class GiftController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    
    @IBAction func sendButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func endWriting(_ sender: Any) {
        self.view.endEditing(true)
    }
    

}
