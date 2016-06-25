//
//  PointViewController.swift
//  tanakaProject
//
//  Created by 原田　礼朗 on 2016/06/25.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit

class PointViewController: UIViewController {
    
    @IBOutlet weak var selectImageView: UIImageView!
    // タイマーを用意する
    var timer: NSTimer!
    // タッチ回数を入れておく部品を用意する
    var counter: Int!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // counterもセットします
        self.counter = 0
        
        // タイマーをセットします
        self.timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "changeImage", userInfo: nil, repeats: true)
    }
    
    // changeImage呼ばれたらどうする？
    func changeImage() {
        // ランダムに画像を変える
        // 乱数教えてよ
        let random = arc4random() % 4
        // もしrandomが0のとき、天気の画像
        // もしrandomが1のとき、人々の画像
        // もしrandomが2のとき、イベントの画像
        // もしrandomが3のとき、ハートの画像
        if random == 0 {
            self.selectImageView.image = UIImage(named: "weather.jpg")
        }
        else if random == 1 {
            self.selectImageView.image = UIImage(named: "people.png")
        }
        else if random == 2 {
            self.selectImageView.image = UIImage(named: "event.gif")
        }
        else {
            self.selectImageView.image = UIImage(named: "cosmo.png")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func tapView(sender: AnyObject) {
        // 一回目のタッチでは、タイマーを止める。
        // 二回目のタッチでは、画面を移動する。
        if self.counter == 0 {
            // タイマーを止める
            self.timer.invalidate()
            self.counter = 1
        }
        else {
            // 画面を移動する
            self.performSegueWithIdentifier("movePrepare", sender: nil)
        }
    }
    
}










