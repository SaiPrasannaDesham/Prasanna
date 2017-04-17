//
//  SignInViewController.swift
//  Voltus
//
//  Created by vw-mac-01 on 01/04/17.
//  Copyright © 2017 vw-mac-01. All rights reserved.
//


import UIKit
import SlideMenuControllerSwift
class SignInViewController: UIViewController {
    @IBOutlet weak var emailView:UIView!
    @IBOutlet weak var emailField:UITextField!
    @IBOutlet weak var passwordView:UIView?
    @IBOutlet weak var passwordField:UITextField!
    @IBOutlet weak var signIn:UIButton!
    @IBOutlet weak var toolBar:UIToolbar!
    @IBOutlet weak var segmentControll:UISegmentedControl!
    @IBOutlet weak var backgroundImage:UIImageView?

    
// Mark: ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true;
        self.emailField?.inputAccessoryView = self.toolBar;
        self.passwordField?.inputAccessoryView = self.toolBar;
       backgroundImage?.applyGradient(isTopBottom: true, colorArray: [.orange, .black])
   
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }
    
    
// Mark: ButtonAction
    
 @IBAction func signIn(sender: UIButton) {
        
    if emailField.text!.characters.count == 0 &&  passwordField.text!.characters.count == 0  {
       self.shake(sender: emailView!)
       self.shake(sender: passwordView!)
        AlertWithMethod(Message: "Please fill all details")
            
    } else if emailField.text!.characters.count == 0 {
         self.shake(sender: emailView!)
         AlertWithMethod(Message: "Please enter Email id.")
            
    } else if  passwordField.text!.characters.count == 0 {
        self.shake(sender: passwordView!)
        AlertWithMethod(Message: "Please enter password.")
    
//    } else if !validateEmail(email: emailField.text!) {
//         AlertWithMethod(Message: "Please valid the email ")
//    
//    } else if !validatePassword(password: passwordField.text!) {
//        AlertWithMethod(Message: "Please valid the password ")
    
    } else {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let collectionViewController = storyboard.instantiateViewController(withIdentifier: "CollectionViewViewControllerNav") as! UINavigationController
            let slideViewViewController = storyboard.instantiateViewController(withIdentifier: "SlideViewViewController") as! SlideViewViewController
            let slideMenuController = SlideMenuController.init(mainViewController: collectionViewController, leftMenuViewController: slideViewViewController)
            self.navigationController?.pushViewController(slideMenuController, animated: true);
           // self.present(slideMenuController, animated: true, completion: {
        //}
   
        }

    }
    
// Mark: ButtonActionMethods
    
    @IBAction func done(sender: UIButton) {
        self.emailField?.resignFirstResponder()
        self.passwordField?.resignFirstResponder()
    
    }
    
    @IBAction func forgotPasswordButton(sender: UIButton) {
        let otpViewController = self.storyboard?.instantiateViewController(withIdentifier: "OTPViewController") as! OTPViewController
        self.navigationController?.pushViewController(otpViewController, animated: true )

    }
    
// Marks: Validation Methods
    
    func validateEmail(email:String) -> Bool {
            let emailRegx:String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest:NSPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegx)
        let result = emailTest.evaluate(with:email)
        return result
    }
    
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



