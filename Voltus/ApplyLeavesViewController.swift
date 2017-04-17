//
//  ApplyLeavesViewController.swift
//  Voltus
//
//  Created by vw-mac-01 on 04/04/17.
//  Copyright © 2017 vw-mac-01. All rights reserved.
//

import UIKit
import FSCalendar
class ApplyLeavesViewController: UIViewController, FSCalendarDataSource, FSCalendarDelegate, UITabBarDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate  {
  
    private weak var calendar: FSCalendar!
    @IBOutlet weak var headerView:UIView?
    @IBOutlet weak var fromDateLeave:UITextField?
    @IBOutlet weak var tillDateLeave:UITextField?
    @IBOutlet weak var selectionOfLeavesType:UITextField?
    @IBOutlet weak var durationLabel:UILabel?
    @IBOutlet weak var availableLeaves:UILabel?
    @IBOutlet weak var fromSegmentController:UISegmentedControl?
    @IBOutlet weak var toSegmentController:UISegmentedControl?
    @IBOutlet weak var reasonTextview:UITextView?
    @IBOutlet weak var subTableView:UITableView?
    @IBOutlet weak var listOfLeaves:UIButton?
    @IBOutlet weak var submitButton:UIButton?
    @IBOutlet weak var closeButton:UIButton?
    @IBOutlet weak var calenderView: UIView?
   
    @IBOutlet weak var fromDateSeperatorView: UIView!
    @IBOutlet weak var tillDateSeperatorView: UIView!
    
    
    
    let typeOfLeavesArray:[String] = ["Casual Laeave","Formal Leave","Sick Leave","Paid Leave"]
    var selectionString: String = " "
    var currentTextFieldTag = 0

    
//Mark: ViewLife Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calenderView?.isHidden = true
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//Mark: TableViewMethod
    
    func numberOfSectionsInTableView(_tableView: UITableView) ->Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) ->Int {
        
        return typeOfLeavesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let applyLeavesCell:ApplyLeavesCell = tableView.dequeueReusableCell(withIdentifier:"ApplyLeavesCell")! as! ApplyLeavesCell
        applyLeavesCell.selectionofLeave?.text = typeOfLeavesArray[indexPath.row]
        return applyLeavesCell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let cell = tableView.cellForRow(at: indexPath as IndexPath) as! ApplyLeavesCell
        selectionString = (cell.selectionofLeave?.text)!
         (selectionOfLeavesType?.text = selectionString)!
        print(selectionString)
    
    }
 
    
    
    
//Mark: ButtonAction
    
    @IBAction func listOfLeaves(sender: UIButton) {
         sender.isSelected  = !sender.isSelected;
               if (sender.isSelected == true) {
                view.addSubview(headerView!)
                headerView?.isHidden = false
          } else {
                
        }
    }

    @IBAction func submitButton(sender: UIButton) {
       
     }
   
    @IBAction func closeButton(sender: UIButton) {
        self.submitButton?.isHidden = false
        self.closeButton?.isHidden = false
        headerView?.isHidden = true
        print(selectionString)
        
    }

    @IBAction func menuButton(sender: UIButton) {

    }

//Mark: TextField Delegate Method

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        currentTextFieldTag = textField.tag;
        self.calenderView?.isHidden = false
        return false
    }
    
//Mark : FSCalender Delegate
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition){
        let dateformatter =  DateFormatter.init()
        dateformatter.dateFormat = "dd-MM-yyyy"
        if  currentTextFieldTag == 1 {
            fromDateLeave?.text = dateformatter.string(from: date)
            self.calenderView?.isHidden = true
        } else  {
            tillDateLeave?.text = dateformatter.string(from: date)
            self.calenderView?.isHidden = true
        }
       
      }
    

 }
