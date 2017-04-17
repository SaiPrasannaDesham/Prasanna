//
//  CentralViewController.swift
//  Voltus
//
//  Created by vw-mac-01 on 01/04/17.
//  Copyright © 2017 vw-mac-01. All rights reserved.
//

import UIKit
import SlideMenuControllerSwift

class CollectionViewViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
@IBOutlet weak var collectionView:UICollectionView?
    
var collectionViewArray:[[String:Any]] = [["image":"Plus.png","label":"Apply Leave Form"],["image":"LeaveBalance.png","label":"Leave Balance"],["image":"LeaveHistory.png","label":"Leave History"],["image":"LeaveApprovalHistory.png","label":"Leave Approval History"],["image":"Atterndence.png","label":"Attendence"]]
    
 //Mark:View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
       }
    
    override func viewDidAppear(_ animated: Bool) {
        self.collectionView?.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
//Mark: CollectionView Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return collectionViewArray.count
     }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let items:CollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        let collectionViewDic:[String:Any] = collectionViewArray[indexPath.item]
        items.collectionCellLabel?.text = collectionViewDic["label"] as? String
        items.collectionCellImage?.image = UIImage(named: collectionViewDic["image"]! as! String)
        return items
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == 0 {
        let applyLeavesViewController = self.storyboard?.instantiateViewController(withIdentifier: "ApplyLeavesViewController") as! ApplyLeavesViewController
            self.navigationController?.pushViewController(applyLeavesViewController, animated: true)
            
            
            
        } else {
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize:CGSize = CGSize.init(width: collectionView.frame.size.width/2.0 - 15.0, height: 100)
        return cellSize
    }
    

//Mark:ButtonAction

    @IBAction func menu(sender: UIButton) {
        self.slideMenuController()?.openLeft()


    }

    

    
    
}
