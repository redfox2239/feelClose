//
//  ViewController.swift
//  tanakaProject
//
//  Created by 原田　礼朗 on 2016/06/25.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var goodMorningButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let now = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH"
        let nowHour = Int(formatter.stringFromDate(now))
        if nowHour > 4 || nowHour < 12 {
            self.startButton.hidden = true
            self.goodMorningButton.hidden = false
        }
        else {
            self.goodMorningButton.hidden = true
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

