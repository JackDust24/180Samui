//
//  ContactController.swift
//  180Samui
//
//  Created by JasonMac on 21/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import Foundation
import UIKit

class ContactController: UIViewController {
    
    
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var enquiryView: UIView!
    @IBOutlet weak var requestView: UIView!
    @IBOutlet weak var transportView: UIView!
    @IBOutlet weak var diningView: UIView!
    
    var buttonTagCounter = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setCurvedRadiusForDisplay(view: enquiryView, radius: 20)
        setCurvedRadiusForDisplay(view: requestView, radius: 20)
        setCurvedRadiusForDisplay(view: transportView, radius: 20)
        setCurvedRadiusForDisplay(view: diningView, radius: 20)
        
        addContentToSubViews(subView: enquiryView, text: "Make An Enquiry", buttonText: "Apply")
        addContentToSubViews(subView: requestView, text: "Request Room Service", buttonText: "08122114424")
        addContentToSubViews(subView: transportView, text: "Need Transport", buttonText: "08122114431")
        addContentToSubViews(subView: diningView, text: "Request Dining", buttonText: "08122114411")
    }
    
    //    override func viewWillLayoutSubviews() {
    //        super.viewWillLayoutSubviews()
    //
    //
    //
    //    }
    
    func addContentToSubViews(subView: UIView, text: String, buttonText: String) {
        
        let label: UILabel = {
            let lb = UILabel()
            lb.translatesAutoresizingMaskIntoConstraints = false
            lb.text = "\(text)"
            lb.font = lb.font.withSize(14)
            lb.font = UIFont.boldSystemFont(ofSize: lb.font.pointSize)
            lb.textColor = .black
            // lb.backgroundColor = .white
            lb.numberOfLines = 0
            return lb
        }()
        
        let subViewWidth = subView.frame.width
        let subViewHeight = subView.frame.height
        
        let button = UIButton(frame: CGRect(x: subViewWidth - 140, y: (subViewHeight / 2) - 12.5, width: 130, height: 25))
        button.backgroundColor = .red
        button.setTitle(buttonText, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.tag = buttonTagCounter
        // Increase the tag counter for the next button.
        buttonTagCounter += 1
        
        addCornerRadiusToButton(button: button)
        
        subView.addSubview(label)
        subView.addSubview(button)
        
        label.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 10).isActive = true
        label.topAnchor.constraint(equalTo: subView.topAnchor, constant: 10).isActive = true
        //  label.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: -10).isActive = true
        label.bottomAnchor.constraint(equalTo: subView.bottomAnchor, constant: -10).isActive = true
        
        
        trailingConstraint.constant = 20
        
        //   button.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 10).isActive = true
        
        //        button.topAnchor.constraint(equalTo: label.topAnchor, constant: 20).isActive = true
        //        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //        button.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: -10).isActive = false
        //        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        //        button.bottomAnchor.constraint(equalTo: subView.bottomAnchor, constant: 10).isActive = true
        //
        
    }
    
    @objc func buttonAction(_ sender: Any) {
        
        let senderButton = sender.self as! UIButton
        print("Test Button \(senderButton)")
        
        let tag = senderButton.tag
        
        switch tag {
        case 0:
            print("Enquiry Clicked")
        case 1:
            print("Request Clicked")
        case 2:
            print("Transport Clicked")
        case 3:
            print("Dining Clicked")
        default:
            print("Hmmm something wrong with my counter")
        }
        
        
    }
    
}

