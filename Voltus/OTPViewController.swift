//
//  OTPViewController.swift
//  Voltus
//
//  Created by vw-mac-01 on 05/04/17.
//  Copyright © 2017 vw-mac-01. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController,UITextFieldDelegate {
@IBOutlet weak var firstTextField:UITextField!
@IBOutlet weak var secondTextField:UITextField!
@IBOutlet weak var thirdTextField:UITextField!
@IBOutlet weak var fourTextField:UITextField!
@IBOutlet weak var toolBar:UIToolbar!

// Mark: ViewLife Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
// Mark: TextField Method
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((textField.text?.characters.count)! < 1  && string.characters.count > 0){
            textField.backgroundColor = UIColor.blue
            let nextTag = textField.tag + 1;
            
            var nextResponder = textField.superview?.viewWithTag(nextTag);
            
            if (nextResponder == nil){
                nextResponder = textField.superview?.viewWithTag(1);
            }
            textField.text = string;
            nextResponder?.becomeFirstResponder();
            return false;
            
        } else if ((textField.text?.characters.count)! >= 1  && string.characters.count == 0){
            let previousTag = textField.tag - 1;
            
            // get next responder
            var previousResponder = textField.superview?.viewWithTag(previousTag);
            
            if (previousResponder == nil){
                previousResponder = textField.superview?.viewWithTag(1);
            }
            textField.text = "";
            previousResponder?.becomeFirstResponder();
            return false;
        } else {
            
            let changePasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
            self.navigationController?.pushViewController(changePasswordViewController, animated: true)

        }
        
        return true;
    }
    
// Mark: ButtonAction
    
    @IBAction func done(sender: UIButton) {
        self.firstTextField.resignFirstResponder()
        self.secondTextField?.resignFirstResponder()
        self.thirdTextField?.resignFirstResponder()
        self.fourTextField?.resignFirstResponder()
    }
 
    
    
    @IBAction func resetPassword(sender: UIButton) {
        let changePasswordViewController = self.storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewController") as! ChangePasswordViewController
        self.navigationController?.pushViewController(changePasswordViewController, animated: true)
        }
    
    }
