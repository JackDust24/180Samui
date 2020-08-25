//
//  Samui180TabBarViewController.swift
//  180Samui
//
//  Created by JasonMac on 21/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import UIKit

class Samui180TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // So we can click the middle image
        let prominentTabBar = self.tabBar as! ProminentTabBar
        prominentTabBar.prominentButtonCallback = prominentTabTaped
        
       
//
//        let button = UIButton()
//        button.setImage(UIImage(named: "home_icon"), for: .normal)
//        button.frame.size = CGSize(width: 70.0, height: 70.0)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.widthAnchor.constraint(equalToConstant: 70.0).isActive = true
//        button.heightAnchor.constraint(equalToConstant: 70.0).isActive = true
//
//        tabBar.addSubview(button)
//        tabBar.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
//        tabBar.topAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
//        
        // Do any additional setup after loading the view.
    }
    
    func prominentTabTaped() {
        selectedIndex = (tabBar.items?.count ?? 0)/2
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

class ProminentTabBar: UITabBar {
    var prominentButtonCallback: (()->())?
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard let items = items, items.count>0 else {
            return super.hitTest(point, with: event)
        }
        
        let middleItem = items[items.count/2]
        let middleExtra = middleItem.imageInsets.top
        let middleWidth = bounds.width/CGFloat(items.count)
        let middleRect = CGRect(x: (bounds.width-middleWidth)/2, y: middleExtra, width: middleWidth, height: abs(middleExtra))
        if middleRect.contains(point) {
            prominentButtonCallback?()
            return nil
        }
        return super.hitTest(point, with: event)
    }
}
