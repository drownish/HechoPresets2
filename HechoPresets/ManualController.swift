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
        vc.imgForMain = UIImage(named: "\(number).jpg")!
        return vc
    }
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.newViewController(number: 11),
                self.newViewController(number: 22),
                self.newViewController(number: 33),
                self.newViewController(number: 44),
                self.newViewController(number: 55),
                self.newViewController(number: 66),
                self.newViewController(number: 77),
                self.newViewController(number: 88),
                self.newViewController(number: 99),
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
        
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
    }
    
    @objc func disappearVC() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }



}
