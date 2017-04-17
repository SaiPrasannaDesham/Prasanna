//
//  RightSideViewController.swift
//  Voltus
//
//  Created by vw-mac-01 on 01/04/17.
//  Copyright © 2017 vw-mac-01. All rights reserved.
//

import UIKit
let picker = UIImagePickerController()

class SlideViewViewController: UIViewController,UITableViewDelegate, UITableViewDataSource,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   
    @IBOutlet weak var middleTableView:UITableView?
    @IBOutlet weak var profileEdit: UIButton?
    @IBOutlet weak var imagePicker: UIImageView?
    var picker:UIImagePickerController?=UIImagePickerController()
    var centralViewController: UIViewController!
    let middleTableViewArray:[[String:Any]] = [["image":"Import.png","label":"Imported"],["image":"Gallery.png","label":"Gallery"],["image":"SlideShow.png","label":"Slideshow"],["image":"Tools.png","label":"Tools"]]
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        
    }
    
//Mark: TableViewMethod
    
    func numberOfSectionsInTableView(_tableView: UITableView) ->Int {
     return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
    
        return middleTableViewArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let middle:MiddeleTableViewCell = tableView.dequeueReusableCell(withIdentifier:"MiddeleTableViewCell")! as! MiddeleTableViewCell
        let middleTableViewDic :[String:Any] = self.middleTableViewArray[indexPath.row];
                print(middleTableViewDic)
        middle.middleTableViewLabel?.text = middleTableViewDic["label"] as? String
        middle.middleTableViewImage?.image = UIImage(named: middleTableViewDic["image"]! as! String)
        return middle
    
    }
    
    @IBAction func logoutButton(sender: UIButton) {
        let signInViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        self.navigationController?.pushViewController(signInViewController, animated: true)

            //self.slideMenuController()?.dismiss(animated: true, completion: nil)
    }
    

    //Mark: CameraAction
   
    
    @IBAction func profileEditButton(sender: UIButton) {
            let alert:UIAlertController=UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
            let deleteAction = UIAlertAction(title: "Delete", style: UIAlertActionStyle.default) {
                UIAlertAction in
                 self.deleteCamera()
            }
            let cameraAction = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default) {
                UIAlertAction in
                self.openCamera()
            }
            let gallaryAction = UIAlertAction(title: "Gallary", style: UIAlertActionStyle.default) {
                UIAlertAction in
                self.openGallary()
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
                UIAlertAction in
            }
            // Add the actions
            picker?.delegate = self
            alert.addAction(deleteAction)
            alert.addAction(cameraAction)
            alert.addAction(gallaryAction)
            alert.addAction(cancelAction)
            if UIDevice.current.userInterfaceIdiom == .phone {
                self.present(alert, animated: true, completion: nil)
            } else {
                
            }
   
    }
        
// Mark: ImagePickerView Methods
        
     func openCamera() {
            if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)) {
                picker!.sourceType = UIImagePickerControllerSourceType.camera
                self .present(picker!, animated: true, completion: nil)
            } else {
                openGallary()
            }
        }
        
        func openGallary() {
            picker!.sourceType = UIImagePickerControllerSourceType.photoLibrary
            if UIDevice.current.userInterfaceIdiom == .phone {
                self.present(picker!, animated: true, completion: nil)
            } else {
                
            }
        }
        
        func deleteCamera() {
          imagePicker?.image = nil
   
        }
// Mark: ImagePicker Delegate Method
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imagePicker?.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        imagePicker?.backgroundColor = UIColor.clear
        imagePicker?.contentMode = UIViewContentMode.scaleAspectFill
        self.dismiss(animated: true, completion: nil)
    }
}
