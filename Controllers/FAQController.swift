//
//  FAQController.swift
//  180Samui
//
//  Created by JasonMac on 21/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import Foundation
import UIKit

class FAQController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var faqViewModel = FAQDataViewModel()
    
    @IBOutlet weak var dataView: UIView!
    
     // master array
    lazy var faqDataToDisplay = faqViewModel.rowsToDisplay
    
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
            faqDataToDisplay = faqViewModel.returnFAQForTable(selectedIndex: 0)
            
        case 1:
            faqDataToDisplay = faqViewModel.returnFAQForTable(selectedIndex: 1)

        default:
            faqDataToDisplay = faqViewModel.returnFAQForTable(selectedIndex: 2)

        }
        
        tableView.reloadData()
    }
    
    
    
    let tableView = UITableView(frame: .zero, style: .plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // view.addSubview(FAQDataView())
        
        tableView.dataSource = self
        tableView.delegate = self
        
        setUpDataView()
        
    }
   
    //MARK: Segemented Controller
    func setUpDataView() {
        
        let paddedStackView = UIStackView(arrangedSubviews: [segmentedControl])
        paddedStackView.layoutMargins = .init(top: 12, left: 12, bottom: 6, right: 12)
        paddedStackView.isLayoutMarginsRelativeArrangement = true
        
        let stackView = UIStackView(arrangedSubviews: [paddedStackView, tableView])
        
        stackView.axis = .vertical
        dataView.addSubview(stackView)
        
        stackView.anchor(top: dataView.safeAreaLayoutGuide.topAnchor, leading: dataView.leadingAnchor, bottom: dataView.bottomAnchor, trailing: dataView.trailingAnchor, padding: .zero)
        
        segmentedControl.layer.borderColor = UIColor.systemGray.cgColor
        segmentedControl.layer.cornerRadius = 0.0
        segmentedControl.layer.borderWidth = 1.5
        segmentedControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
        if #available(iOS 13.0, *) {
            segmentedControl.selectedSegmentTintColor = UIColor.red
            
        } else {
            // Fallback on earlier versions
            segmentedControl.tintColor = UIColor.red
            
        }
        
    }
    
}

extension FAQController {
    
    //MARK: Table View Controller Data Source and Delagtes
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("Check data loaded - \(faqDataToDisplay.count)")
        return faqDataToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        // cell.textLabel?.text = rowsToDisplay[indexPath.row]
        let questionText = faqViewModel.retrieveSpecificDetailsFromFAQArray(selectedRow: indexPath.row, selectedFAQArray: faqDataToDisplay, isItAQuestion: true)
        cell.textLabel?.text = questionText
        cell.textLabel?.numberOfLines = 2
        cell.accessoryType = .disclosureIndicator
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let questionText = faqViewModel.retrieveSpecificDetailsFromFAQArray(selectedRow: indexPath.row, selectedFAQArray: faqDataToDisplay, isItAQuestion: true)
        let answerText = faqViewModel.retrieveSpecificDetailsFromFAQArray(selectedRow: indexPath.row, selectedFAQArray: faqDataToDisplay, isItAQuestion: false)
        
        print("Selection Test - \(questionText)")
        
//        let faqDetailVC = "FAQDetailViewController"
//        let detailViewController = storyboard?.instantiateViewController(withIdentifier: faqDetailVC)  as! FAQDetailViewController
//        self.navigationController?.pushViewController(detailViewController, animated: true)
//
//        tableView.deselectRow(at: indexPath, animated: true)
        
        let objVC: FAQDetailViewController? = storyboard?.instantiateViewController(withIdentifier: "FAQDetailViewController") as? FAQDetailViewController
        
       //  let aObjNavi = UINavigationController(rootViewController: objVC!)
        
        objVC?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        
        self.present(objVC!, animated: true) {
            print("Present Contr5oller")
            
            objVC?.answerTextView.text = answerText
            objVC?.questionLabel.text = questionText
        }
        
        tableView.deselectRow(at: indexPath, animated: true)

        
    }
}
