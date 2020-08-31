//
//  LinksViewModel.swift
//  180Samui
//
//  Created by JasonMac on 31/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import Foundation

class Links {
    
    static var events = [Link]()
    static var dining = [Link]()
    static var gallery = [Link]()
    
    
    init() {
        print("INIT")
        
        Links.events = createLinks(type: kTypeEvents)
        Links.dining = createLinks(type: kTypeDining)
        Links.gallery = createLinks(type: kTypeGallery)
    }
    
    
    
    func returnSpecificItems(type: String, for property: LinksProperty) -> [String] {
        
        // Nothing specified
        if type == "" {
            return [""]
            
        }
       
        // 1 Populate the appropriate array
        var array = [Link]()
        
        switch type {
        case kTypeEvents:
            array = Links.events
        case kTypeDining:
            array = Links.dining
        default:
            array = Links.gallery
        }
        
        // 2 Return depending on the property
        if property == LinksProperty.title {
            return array.map { $0.title }
            
        } else if property == LinksProperty.image {
            return array.map { $0.image }
            
        }
        
        // Will not be called but in case, this is the default
        return array.map { $0.title }
       
           
    }
}

public enum LinksProperty {
    case title
    case type
    case image
}
