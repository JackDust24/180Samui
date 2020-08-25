//
//  FAQDataViewModel.swift
//  180Samui
//
//  Created by JasonMac on 24/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import Foundation

public class FAQDataViewModel {
    
   // private let faq: FAQ
    // 1 Create a property to get the data object
    private var faqData: [FAQDataModel]
    
    public init() {
        self.faqData = dataFromJSON // Point to the loaded data property
        // getSampleData()
        print("Check Data FAQ - \(faqData)")
        extractFAQData()

    }
   
    func returnFAQForTable(selectedIndex: Int) -> [FAQ] {
        print("HandleChange")
        print(selectedIndex)
        
        var arrayForTableView = [FAQ]()
        
        switch selectedIndex {
        case 0:
            arrayForTableView = bookings
        case 1:
            arrayForTableView = services
        default:
            arrayForTableView = travel
        }
        
        return arrayForTableView
    }
    
    func retrieveQuestionFromFAQArray(selectedRow: Int, selectedFAQArray: [FAQ]) -> String {
        let questions = selectedFAQArray.map { $0.question }
        print("JW - Test \(questions)")
        print(questions[selectedRow])

        //return "Hello World"
        return questions[selectedRow]
        
    }
  
    var bookings = [
        FAQ.init(type: "", question: "", answer: "")
    ]
    
    var services = [FAQ]()
    var travel = [FAQ]()

    
   // master array
   lazy var rowsToDisplay = bookings
    
    func extractFAQData() {
        
        // We want to remove the intial loaded Bookings array
        bookings = []
        
        var arrayOfData = [FAQ]()
        
        for (_, faq) in faqData.enumerated() {
            let data = FAQ.init(type: faq.type, question: faq.question, answer: faq.answer)
            arrayOfData.append(data)
        }
        
        arrayOfData.forEach{
            addFAQsToArrays(faq: $0)
        }
        
    }
    
     
    func addFAQsToArrays(faq: FAQ) {
            
        if faq.type == "Bookings" {
            bookings.append(faq)
        } else if faq.type == "Services" {
            services.append(faq)
        } else {
            travel.append(faq)

        }
    }
}
