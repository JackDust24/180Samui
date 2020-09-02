//
//  LinksViewController.swift
//  180Samui
//
//  Created by JasonMac on 26/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import UIKit

private let itemsPerRow: CGFloat = 2

// So we have specific info about the chosen link.
private struct SpecificLink {
    
    let title: String
    let image: String
}

class LinksViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: Properties
    // The View model property
    let linksVM = Links()
    // Is it an event, or Gallery? This is popul;ated from the main controller
    var linksType: String = ""
    var linksLabels = [String]()
    var linksImages = [String]()
    
    // For popualting the title label
    var titleForLLabel: String = "Title"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Collection Cell Info
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in
    private let sectionInsets = UIEdgeInsets(top: 50.0,
                                             left: 20.0,
                                             bottom: 50.0,
                                             right: 20.0)
    
    // For passing data to the detail pop up controller
    fileprivate var specificLink: SpecificLink!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = titleForLLabel
        
        // Populate the labels and images
        linksLabels = linksVM.returnSpecificItems(type: linksType, for: .title)
        linksImages = linksVM.returnSpecificItems(type: linksType, for: .image)

        
    }
    
        
    // MARK: - UICollectionViewDataSource protocol
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.linksLabels.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! SamuiCollectionViewCell
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
        let image = "\(self.linksImages[indexPath.item])"
        cell.myLabel.text = self.linksLabels[indexPath.item]
        cell.myImage.image = UIImage(named: image)
        cell.backgroundColor = UIColor.cyan // make cell more visible in our example project
        
        return cell
    }
    
    
    
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
        let image = "\(self.linksImages[indexPath.item])"
        let label = self.linksLabels[indexPath.item]
        
        specificLink = SpecificLink(title: label, image: image)
        
        performSegue(withIdentifier: "LinksPopUp", sender: specificLink)
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print("Prepare segue Info")
        
        if segue.identifier == "LinksPopUp" {

             if let popUpVC = segue.destination as? PopUpLinksController {

                popUpVC.passedTitle = specificLink.title
                popUpVC.passedImage = specificLink.image

             }

         }
        
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     
    
}


// MARK: - Collection View Flow Layout Delegate
extension LinksViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        print("UICollectionViewDelegateFlowLayout Called")
        //2
//        let widthTest = collectionView.frame.width
        
        /*
         let paddingSpace = sectionInsets.left * (itemsPerRow + 0)
         let availableWidth = collectionView.frame.width - paddingSpace
         let widthPerItem = availableWidth / itemsPerRow
         
         return CGSize(width: widthPerItem + 20, height: widthPerItem + 60)
         */
        
        
        let padding: CGFloat =  10
        let collectionViewSize = collectionView.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: collectionViewSize)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    // 4
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    
}


extension LinksViewController {
    
    func passDataToLinksVC(type: String) {
        print("Delegate passed - \(type)")
        //TODO: Error Handling
        titleForLLabel = type
        linksType = type
    }
}

