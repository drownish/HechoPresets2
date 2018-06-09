//
//  FirstPageOfManual.swift
//  HechoPresets
//
//  Created by Максим Белугин on 04.06.2018.
//  Copyright © 2018 Максим Белугин. All rights reserved.
//

import UIKit

class FirstPageOfManual: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        mainTitle.text = textForMainTitle
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var mainTitle: UILabel!
    var textForMainTitle = ""
    

}
