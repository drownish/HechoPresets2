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
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return presets.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! PresetsCell
        cell.imageCell.image = presetsPreviews[indexPath.row]
        cell.titleOfCell.text = ((presets[indexPath.row]! as NSString).lastPathComponent as NSString).deletingPathExtension
        cell.layer.cornerRadius = 8
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let doc = NSURL(fileURLWithPath: presets[indexPath.row]!)
        
        let activity = UIActivityViewController(activityItems: [doc], applicationActivities: nil)
        activity.excludedActivityTypes = [.addToReadingList, .airDrop, .assignToContact, .copyToPasteboard, .saveToCameraRoll, .print]
        self.present(activity, animated: true)
    }


}
