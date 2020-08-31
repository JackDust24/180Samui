//
//  LinksViewController.swift
//  180Samui
//
//  Created by JasonMac on 26/8/2563 BE.
//  Copyright © 2563 Jason Whittaker. All rights reserved.
//

import UIKit
private let itemsPerRow: CGFloat = 2


class LinksViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let linksVM = Links()
    
    var titleForLLabel: String = "Title"
    var linksType: String = ""
    
    var linksLabels = [String]()
    // Temp labels
    var linksImages = [String]()
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    let reuseIdentifier = "cell" // also enter this string as the cell identifier in the storyboard
    //    var itemsLabels = ["1", "2", "3", "4", "5", "6", "7", "8"]
    //    // Temp labels
    //    var itemsImages = ["couple.jpg", "dining.jpg", "dive.jpg", "pool.jpg", "sunrise.jpg", "villa-design2.jpg", "home_drone.jpg", "Home_5104.1.jpg"]
    private let sectionInsets = UIEdgeInsets(top: 50.0,
                                             left: 20.0,
                                             bottom: 50.0,
                                             right: 20.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.titleLabel.text = titleForLLabel
        
        linksLabels = linksVM.returnSpecificItems(type: linksType, for: .title)
        linksImages = linksVM.returnSpecificItems(type: linksType, for: .image)
        //        let itemSize = UIScreen.main.bounds.width/2 - 3
        //
        //        let layout = UICollectionViewFlowLayout()
        //        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        //        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        //
        //        layout.minimumInteritemSpacing = 3
        //        layout.minimumLineSpacing = 3
        //
        //        collectionView.collectionViewLayout = layout
        // Do any additional setup after loading the view.
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
        
        performSegue(withIdentifier: "LinksPopUp", sender: self)
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
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

