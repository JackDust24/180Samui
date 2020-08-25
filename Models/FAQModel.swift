//
//  FAQModel.swift
//  180Samui
//
//  Created by JasonMac on 24/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import Foundation

public struct FAQ {
  
  public let type: String
  public let question: String
  public let answer: String
    
  public init(type: String,
              question: String,
              answer: String) {
    self.type = type
    self.question = question
    self.answer = answer
  }
    
      
}
