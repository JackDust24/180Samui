//
//  LoginViewController.swift
//  180Samui
//
//  Created by JasonMac on 2/9/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.addCornerRadiusToTextField(radius: 10)
        emailTextField.addCornerRadiusToTextField(radius: 10)
        
        // Do any additional setup after loading the view.
        
        
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
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
