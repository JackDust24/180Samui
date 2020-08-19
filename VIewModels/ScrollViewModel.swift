//
//  ScrollVIewModel.swift
//  180Samui
//
//  Created by JasonMac on 19/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import Foundation
import UIKit

class ScrollViewModel {
    
    func returnImageForView(for type: String) -> String {
        
        if type == kTypeDining {
            return "dining.jpg"
        } else if type == kTypeEvents {
            return "couple.jpg"
        } else if type == kTypeGallery {
            return "dive.jpg"
        } else if type == kTypeLocation {
            return "sunrise.jpg"
        }
        
        return ""
    }
    
    func resizeImage(for image: String) -> UIImage? {
        return nil
    }
    
}
// Retrieve the pictures
// Match to text to the pictures

// User selects the image
