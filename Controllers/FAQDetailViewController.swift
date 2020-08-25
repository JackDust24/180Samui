//
//  FAQDetailViewController.swift
//  180Samui
//
//  Created by JasonMac on 25/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import UIKit

class FAQDetailViewController: UIViewController {
    
    @IBOutlet weak var answerTextView: UITextView!
    
    @IBOutlet weak var questionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func dismissButton(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
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
