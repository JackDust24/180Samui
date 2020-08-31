//
//  LinksModel.swift
//  180Samui
//
//  Created by JasonMac on 31/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import Foundation

public struct Link {
    public let title: String
    public let image: String
    public let type: LinkType
    
    public enum LinkType: String {
        case event
        case gallery
        case dining
    }
}

func createLinks(type: String) -> [Link] {
    print("CREATE LINKS")
    switch type {
    case kTypeEvents:
        
        let event = Link(title: "A", image: "couple.jpg", type: .event)
        let event2 = Link(title: "B", image: "dive.jpg", type: .event)
        let event3 = Link(title: "C", image: "sunrise.jpg", type: .event)
        return [event, event2, event3]
    case kTypeDining:
        
        let dining = Link(title: "D", image: "dining.jpg", type: .dining)
        let dining2 = Link(title: "E", image: "pool.jpg", type: .dining)
        let dining3 = Link(title: "F", image: "sunrise.jpg", type: .dining)
        return [dining, dining2, dining3]
    case kTypeGallery:
        let gallery = Link(title: "G", image: "villa-design2.jpg", type: .gallery)
        let gallery2 = Link(title: "H", image: "home_drone.jpg", type: .gallery)
        let gallery3 = Link(title: "IC", image: "Home_5104.1.jpg", type: .gallery)
        return [gallery, gallery2, gallery3]
        
     default:
        let gallery = Link(title: "L", image: "villa-design2.jpg", type: .gallery)
        let gallery2 = Link(title: "M", image: "home_drone.jpg", type: .gallery)
        let gallery3 = Link(title: "N", image: "Home_5104.1.jpg", type: .gallery)
        return [gallery, gallery2, gallery3]
    }
}

