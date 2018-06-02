//
//  PresetsController.swift
//  HechoPresets
//
//  Created by Максим Белугин on 02.06.2018.
//  Copyright © 2018 Максим Белугин. All rights reserved.
//

import UIKit


class PresetsController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }



    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath)
    
        // Configure the cell
    
        return cell
    }


}
