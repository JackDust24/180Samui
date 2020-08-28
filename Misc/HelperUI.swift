//
//  HelperUI.swift
//  180Samui
//
//  Created by JasonMac on 25/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import Foundation
import UIKit

// For UI Views so they can have a corner
func setCurvedRadiusForDisplay(view: UIView, radius: CGFloat) {
    
    view.layer.cornerRadius = radius
    view.clipsToBounds = true
    
}

// For UI Buttons so they can have a corner
func addCornerRadiusToButton(button: UIButton) {
    
    button.layer.cornerRadius = 10
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.lightGray.cgColor
    button.clipsToBounds = true
    
}

@propertyWrapper
public struct UsesAutoLayout<T: UIView> {
    public var wrappedValue: T {
        didSet {
            wrappedValue.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}
