//
//  FAQData.swift
//  180Samui
//
//  Created by JasonMac on 25/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import Foundation
import UIKit

// 1. Load the Info from the Info.json file
let dataFromJSON: [FAQDataModel] = load("Sample_data.json")

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {

    print("Load FAQ Data")
    // 2. Create a data object
    let faqData: Data
    
    // 3. Check that the file ins't empty/
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    // 4. Get the contents of the file
    do {
        faqData = try Data(contentsOf: file)
    }
        
    catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    // 5. Decode it
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: faqData)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
    
}



