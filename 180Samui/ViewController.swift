//
//  ViewController.swift
//  180Samui
//
//  Created by JasonMac on 18/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var eventsButton: UIButton!
    @IBOutlet weak var diningButton: UIButton!
    @IBOutlet weak var locationButton: UIButton!
    @IBOutlet weak var galleryButton: UIButton!
    
    let scrollViewModel = ScrollViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpCallToActionView()
        setUpImagesForButtonsInScrollView()
    }
    
    func setUpCallToActionView() {
        containerView.layer.cornerRadius = 10.0
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.6
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 15
        
        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
//
        containerView.layer.shouldRasterize = true
//        cardView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func setUpImagesForButtonsInScrollView() {
        
        let eventsImage = scrollViewModel.returnImageForView(for: kTypeEvents)
        let diningImage = scrollViewModel.returnImageForView(for: kTypeDining)
        let locationImage = scrollViewModel.returnImageForView(for: kTypeLocation)
        let galleryImage = scrollViewModel.returnImageForView(for: kTypeGallery)
      
        eventsButton.setImage(UIImage(named: eventsImage), for: .normal)
        diningButton.setImage(UIImage(named: diningImage), for: .normal)
        locationButton.setImage(UIImage(named: locationImage), for: .normal)
        galleryButton.setImage(UIImage(named: galleryImage), for: .normal)

    }


    @IBAction func bookNow(_ sender: Any) {
        print("BOOKED NOWS")
    }
}

