//
//  PageOfManual.swift
//  HechoPresets
//
//  Created by Максим Белугин on 04.06.2018.
//  Copyright © 2018 Максим Белугин. All rights reserved.
//

import UIKit

class PageOfManual: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        mainImg.image = imgForMain
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func skipButton(_ sender: Any) {
        if isFirst {
            print("posted to disappear as first")
            NotificationCenter.default.post(name: NSNotification.Name("dismissManualFirst"), object: nil)
            
        }
        else {
            print("posted to disappear as usual")
            NotificationCenter.default.post(name: NSNotification.Name("dismissManual"), object: nil)
            
        }
    }
    
    @IBOutlet var mainImg: UIImageView!
    
    var imgForMain = UIImage()
    
}
