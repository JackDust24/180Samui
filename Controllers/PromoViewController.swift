//
//  ChatViewController.swift
//  180Samui
//
//  Created by JasonMac on 24/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import UIKit

class PromoViewController: UIViewController {

    @IBOutlet weak var button: UIButton!

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var promoLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let promotion = getPromotion()
        promoLabel.text = promotion.title
        imageView.image = promotion.image
        textView.text = promotion.promoText

        // Do any additional setup after loading the view.
        
//        button.translatesAutoresizingMaskIntoConstraints = false
//        
//        let constraints = [
//            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            button.widthAnchor.constraint(equalToConstant: 100),
//            button.heightAnchor.constraint(equalTo: button.widthAnchor)
//        ]
//        NSLayoutConstraint.activate(constraints)
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
