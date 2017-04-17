//
//  ChangePasswordViewController.swift
//  Voltus
//
//  Created by vw-mac-01 on 06/04/17.
//  Copyright © 2017 vw-mac-01. All rights reserved.
//

import UIKit

class ChangePasswordViewController: UIViewController {
   
    @IBOutlet weak var newPasswordView:UIView!
    @IBOutlet weak var newPasswordField:UITextField!
    @IBOutlet weak var confrimPasswordView:UIView?
    @IBOutlet weak var confrimPasswordField:UITextField!
    @IBOutlet weak var resetButton:UIButton!
    @IBOutlet weak var toolBar:UIToolbar!
    @IBOutlet weak var segmentControll:UISegmentedControl!
    @IBOutlet weak var backgroundImage:UIImageView?
  
    
    
// Marks: ViewLifeCycleMethod

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true;
        self.confrimPasswordField?.inputAccessoryView = self.toolBar;
        self.newPasswordField.inputAccessoryView = self.toolBar;
        backgroundImage?.applyGradient(isTopBottom: true, colorArray: [.orange, .black])

     }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
// Marks: Validation Methods
    
    @IBAction func resetButton(sender: UIButton) {
       
        if confrimPasswordField.text!.characters.count == 0 && newPasswordField.text!.characters.count == 0  {
            self.shake(sender: confrimPasswordView!)
            self.shake(sender: newPasswordView!)
            AlertWithMethod(Message: "Please fill all details")
            
        } else if newPasswordField.text!.characters.count == 0 {
            self.shake(sender: newPasswordView!)
            AlertWithMethod(Message: "Please enter new password.")
            
        } else if  confrimPasswordField.text!.characters.count == 0 {
            self.shake(sender: confrimPasswordView!)
            AlertWithMethod(Message: "Please enter confrim password.")
            
        }  else if !validatePassword(password: confrimPasswordField.text!) {
            self.shake(sender: confrimPasswordView!)
            AlertWithMethod(Message: "Please enter vaild password.")

        } else if confrimPasswordField.text != newPasswordField.text {
            self.shake(sender: confrimPasswordView!)
            self.shake(sender: newPasswordField!)
            AlertWithMethod(Message: "Password does't match")
        
        } else {
            
            let signInViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
            self.navigationController?.pushViewController(signInViewController, animated: true)
        }
        
    }
    
// Marks: Validation Methods

    
    func validatePassword(password:String) -> Bool {
        let passwordRegx:String = "(?=^.{8,}$)((?=.*\\d)|(?=.*\\W+))(?![.\\n])(?=.*[A-Z])(?=.*[a-z]).*$"
        let passwordTest:NSPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegx)
        let result = passwordTest.evaluate(with:password)
        return result
    }

    
// Marks: TextField Shake Method
    
     func shake(sender:UIView) {
         let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
         animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
         animation.duration = 0.6
         animation.values = [-20.0, 20.0, -20.0, 20.0, -10.0, 10.0, -5.0, 5.0, 0.0 ]
         sender.layer .add(animation, forKey: "shake")
        
    }
    
// Marks:Alert Method
    
     func AlertWithMethod(Message:String) {
        let alertController = UIAlertController(title: "Alert", message:Message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Ok", style: .default) { (action:UIAlertAction) in
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion:nil)
        
     }

 }
