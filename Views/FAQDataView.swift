//
//  FAQDataView.swift
//  180Samui
//
//  Created by JasonMac on 24/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import UIKit

class FAQDataView: UIView {
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    let segmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Bookings", "Services", "Travel"])
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleSegmentChange), for: .valueChanged)
        return sc
    }()
    
    @objc fileprivate func handleSegmentChange() {
        print("HandleChange")
        print(segmentedControl.selectedSegmentIndex)
                
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            rowsToDisplay = games
        case 1:
            rowsToDisplay = tvShows
        default:
            rowsToDisplay = devices
        }
        
        tableView.reloadData()
    }

    let tableView = UITableView(frame: .zero, style: .plain)

    let games = [
        "World Of Warcraft", "Fortnite", "PubG", "Tetris"
    ]

let tvShows = [
    "Full House", "Dr. Who"
]

let devices = ["iMac Pro", "Mac Mini"]

// master array
lazy var rowsToDisplay = games
    
    override func draw(_ rect: CGRect) {
        print("Load View")
        setUpViews()
    }
    
    func setUpViews() {
        
        let stackView = UIStackView(arrangedSubviews: [segmentedControl, tableView])
        stackView.axis = .vertical
        self.addSubview(stackView)
        stackView.anchor(top: self.safeAreaLayoutGuide.topAnchor, leading: self.leadingAnchor, bottom: self.bottomAnchor, trailing: self.trailingAnchor, padding: .zero)
        
    }
    
    
    
}
