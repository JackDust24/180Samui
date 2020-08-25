//
//  FAQDataModel.swift
//  180Samui
//
//  Created by JasonMac on 25/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

struct FAQDataModel : Hashable, Decodable {
    //  var id = UUID()
    var type: String
    var question: String
    var answer: String
}
