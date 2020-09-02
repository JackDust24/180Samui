//
//  PopUpLinksController.swift
//  180Samui
//
//  Created by JasonMac on 31/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import UIKit

class PopUpLinksController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    
    var passedTitle: String!
    var passedImage: String!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        print("POPUP")
        
        label.text = passedTitle
        image.image = UIImage(named: passedImage)
        // Do any additional setup after loading the view.
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
