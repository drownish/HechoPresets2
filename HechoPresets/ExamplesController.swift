//
//  ExamplesController.swift
//  HechoPresets
//
//  Created by Максим Белугин on 01.06.2018.
//  Copyright © 2018 Максим Белугин. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cell"

class ExamplesController: UICollectionViewController {
    
    
    lazy var imgsCompressed: [UIImage] = {
        var returnArray = [UIImage]()
        
        for i in examples {
            let img = i.first?.value
            let data = UIImageJPEGRepresentation(img!, 0.3)
            let imgCompressed = UIImage(data: data!)
            returnArray.append(imgCompressed!)
            print("appended")
            
        }
        print(returnArray)
        return returnArray
    }()

    @IBAction func press(_ sender: UILongPressGestureRecognizer) {
        print("press")
        popupImage.image = examples[selected].first?.key
        if sender.state == .ended {
            popupImage.image = examples[selected].first?.value
        }
    }
    
    
    @IBAction func closePopup(_ sender: Any) {
        
        UIView.animate(withDuration: 0.15, animations: {
            self.popupView.alpha = 0
        }, completion: { succes in
            self.popupView.removeFromSuperview()
        })
        collectionView?.isUserInteractionEnabled = true
    }
    @IBOutlet var popupView: UIView!
    @IBOutlet weak var popupImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    func popup(image: UIImage) {
        popupImage.image = image
        popupView.layer.cornerRadius = 8
        popupView.clipsToBounds = true
        collectionView?.isUserInteractionEnabled = false
        
        
        popupView.frame.size.width = collectionView!.frame.size.width - 50
        popupView.frame.size.height = popupView.frame.size.width*(image.size.height/image.size.width)
        popupView.center = (collectionView?.center)!
        
        self.popupView.alpha = 0
        self.view.addSubview(popupView)
        UIView.animate(withDuration: 0.15, animations: {
            self.popupView.alpha = 1
        })
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return examples.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ExampleCell
        cell.layer.cornerRadius = 8
        /*let img = examples[indexPath.row].first?.value
        let data = UIImageJPEGRepresentation(img!, 0.3)
        let imgCompressed = UIImage(data: data!)*/
        cell.imageCell.image = imgsCompressed[indexPath.row]
        cell.titleOfCell.text = examplesNames[indexPath.row]
        return cell
    }

    
    var selected = 0
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        popup(image: examples[indexPath.row].first!.value)
        selected = indexPath.row
        
    }
 

}
