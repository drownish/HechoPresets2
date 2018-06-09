//
//  ManualController.swift
//  HechoPresets
//
//  Created by Максим Белугин on 03.06.2018.
//  Copyright © 2018 Максим Белугин. All rights reserved.
//

import UIKit

class ManualController: UIPageViewController, UIPageViewControllerDataSource {
    
    private func newViewController(number: Int) -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "tut1") as! PageOfManual
        vc.imgForMain = UIImage(named: "\(number)z.jpg")!
        return vc
    }
    
    private func newViewControllerFirst(title: String) -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "tut2") as! FirstPageOfManual
        vc.textForMainTitle = title
        return vc
    }
    
    private func newViewController2(number: Int) -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "tut1") as! PageOfManual
        vc.imgForMain = UIImage(named: "apply\(number).jpg")!
        return vc
    }
    
    private func lastViewController() -> UIViewController {
        let vc = UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "tut3") as! LastPageOfManual
        return vc
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newViewControllerFirst(title: "Make your pictures awesome, just use my Presets for Lightroom"),
                self.newViewControllerFirst(title: "How to upload Presets into Lightroom"),
                self.newViewController(number: 33),
                self.newViewController(number: 44),
                self.newViewController(number: 55),
                self.newViewController(number: 66),
                self.newViewController(number: 77),
                self.newViewController(number: 88),
                self.newViewController(number: 99),
                self.newViewControllerFirst(title: "How to apply presets, all instructions"),
                self.newViewController2(number: 1),
                self.newViewController2(number: 2),
                self.newViewController2(number: 3),
                self.newViewController2(number: 4),
                self.newViewController2(number: 5),
                self.newViewController2(number: 6),
                self.newViewController2(number: 7),
                self.newViewController2(number: 8),
                self.newViewController2(number: 9),
                self.newViewController2(number: 10),
                self.newViewController2(number: 11),
                self.newViewController2(number: 12),
                self.newViewController2(number: 13),
                self.newViewController2(number: 14),
                self.newViewController2(number: 15),
                self.newViewController2(number: 16),
                self.newViewController2(number: 17),
                self.newViewController2(number: 18),
                self.newViewController2(number: 19),
                self.newViewController2(number: 20),
                self.lastViewController()
                ]
    }()
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)

        NotificationCenter.default.addObserver(self, selector: #selector(disappearVC), name: NSNotification.Name("dismissManual"), object: nil)
        if isFirst {
            NotificationCenter.default.addObserver(self, selector: #selector(disappearVCFirst), name: NSNotification.Name("dismissManualFirst"), object: nil)
        }
        
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    @objc func disappearVC() {
        print("disappeared as usual")
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func disappearVCFirst() {
        print("disappeared as first")
        DispatchQueue.main.async(execute: {
            self.performSegue(withIdentifier: "toMainFromManual", sender: nil)
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }



}
