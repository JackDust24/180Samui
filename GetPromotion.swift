//
//  GetPromotion.swift
//  180Samui
//
//  Created by JasonMac on 28/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import Foundation
import UIKit

func getPromotion() -> PromotionViewModel {
    
    let image = UIImage(named: "banner.jpg")!
    
    let promo = PromotionModel(title: "10% Off", imagePromo: image, promoText: "Limited offer for all existing customers. If you have stayed with us before, call us to claim your 10% off for your next stay.")
    
    let viewModel = PromotionViewModel(promo: promo)
    
    return viewModel

}
