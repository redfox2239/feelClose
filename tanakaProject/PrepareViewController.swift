//
//  PrepareViewController.swift
//  tanakaProject
//
//  Created by 原田　礼朗 on 2016/07/02.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit
import AVFoundation

class PrepareViewController: UIViewController {
    
    @IBOutlet weak var prepareLabel: UILabel!
    @IBOutlet weak var prepareImageView: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var tomorrowLabel: UILabel!
    var audioPlayer: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tomorrowLabel.hidden = true
        
        // 音楽を鳴らす
        do {
            // 音楽を選ぶ
            let path = NSBundle.mainBundle().pathForResource("ピー", ofType: "m4a")
            let url = NSURL(fileURLWithPath: path!)
            audioPlayer = try AVAudioPlayer(contentsOfURL: url)
            audioPlayer.prepareToPlay()
            
            audioPlayer.play()
        }
        catch {
            print("エラー")
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        let now = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH"
        let nowHour = Int(formatter.stringFromDate(now))
        if nowHour > 4 || nowHour < 12 {
            self.navigationController?.popToRootViewControllerAnimated(true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapDoneButton(sender: AnyObject) {
        let isDidPrepared = true
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(isDidPrepared, forKey: "isDidPrepared")
        defaults.synchronize()
        
        prepareLabel.hidden = true
        prepareImageView.hidden = true
        doneButton.hidden = true
        tomorrowLabel.hidden = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
