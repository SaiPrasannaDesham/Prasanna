//
//  CalenderViewController.swift
//  Voltus
//
//  Created by vw-mac-01 on 04/04/17.
//  Copyright © 2017 vw-mac-01. All rights reserved.
//

import UIKit
import FSCalendar
class CalenderViewController:  UIViewController, FSCalendarDataSource, FSCalendarDelegate {
//    @IBOutlet weak var subView:UIView?
//    private weak var calendar: FSCalendar!
//    
//    override func loadView() {
//        
//        let view = UIView(frame: UIScreen.main.bounds)
//        view.backgroundColor = UIColor.groupTableViewBackground
//        self.view = view
//        let height: CGFloat = UIDevice.current.model.hasPrefix("iPad") ? 400 : 300
//        let calendar = FSCalendar(frame: CGRect(x: 0, y: self.navigationController!.navigationBar.frame.maxY, width: self.view.bounds.width, height: height))
//        calendar.dataSource = self
//        calendar.delegate = self
//        calendar.backgroundColor = UIColor.white
//        calendar.allowsSelection = true
//        self.view.addSubview(calendar)
//        self.calendar = calendar
//        self.navigationController?.navigationBar.isHidden = false
//        
//        
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.title = "Apply Leaves"
//    }
//    
//    
//    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        if monthPosition == .previous || monthPosition == .next {
//            calendar.setCurrentPage(date, animated: true)
//        }
//   }
//    
//    
//    

}
