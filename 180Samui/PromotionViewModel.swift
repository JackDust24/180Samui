//
//  PromotionViewModel.swift
//  180Samui
//
//  Created by JasonMac on 28/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import Foundation
import UIKit

public class PromotionViewModel {
    
    private let promo: PromotionModel
    
    init(promo: PromotionModel) {
        self.promo = promo
    }
    
    public var title: String {
        return promo.title
    }
    
    public var image: UIImage {
        return promo.imagePromo
    }
    
    public var promoText: String {
        return promo.promoText
    }
    
    
}


// Promotion Model

struct PromotionModel {
    var title: String
    var imagePromo: UIImage
    var promoText: String
}
