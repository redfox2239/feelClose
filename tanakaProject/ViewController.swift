//
//  ViewController.swift
//  tanakaProject
//
//  Created by 原田　礼朗 on 2016/06/25.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var goodMorningButton: UIButton!
    @IBOutlet weak var animationImageView: UIImageView!
    var counter: Int = 0
    var imgData: [UIImage] = []
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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

        let now = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "HH"
        let nowHour = Int(formatter.stringFromDate(now))
        if nowHour > 15 && nowHour < 22 {
            self.startButton.hidden = true
            self.goodMorningButton.hidden = false
        }
        else {
            self.goodMorningButton.hidden = true
        }
        
        for i in 1..<57 {
            let img = UIImage(named: "image\(i).gif")
            imgData.append(img!)
        }

        animateImage()
    }
    
    func animateImage() {
        self.animationImageView.animationImages = self.imgData
        self.animationImageView.animationDuration = 5.0
        self.animationImageView.startAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapChangeNightAndMorningModeButton(sender: AnyObject) {
        self.startButton.hidden = !self.startButton.hidden
        self.goodMorningButton.hidden = !self.goodMorningButton.hidden
    }

}

