//
//  takePictureViewController.swift
//  tanakaProject
//
//  Created by 原田　礼朗 on 2016/07/02.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit
import Social

class takePictureViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIDocumentInteractionControllerDelegate {

    @IBOutlet weak var pictImageView: UIImageView!
    lazy private var documentInteractionController = UIDocumentInteractionController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tapCameraButton(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
            let cameraPicker = UIImagePickerController()
            cameraPicker.sourceType = UIImagePickerControllerSourceType.Camera
            cameraPicker.delegate = self
            self.presentViewController(cameraPicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func tapSavePicture(sender: AnyObject) {
        guard let image = self.pictImageView.image else {
            return
        }
        UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
        let alert = UIAlertController(title: "写真を保存しました", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
        let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default) { (alert) in
            self.performSegueWithIdentifier("seeYouLater", sender: nil)
        }
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        self.pictImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func tapLineButton(sender: AnyObject) {
        guard let sendImage = self.pictImageView.image else {
            return
        }
        let pasteBoard = UIPasteboard.generalPasteboard()
        pasteBoard.setData(UIImagePNGRepresentation(sendImage)!, forPasteboardType: "public.png")
        let urlString = NSString(format: "line://msg/image/%@", pasteBoard.name)
        if UIApplication.sharedApplication().canOpenURL(NSURL(string: urlString as String)!) {
            UIApplication.sharedApplication().openURL(NSURL(string: urlString as String)!)
        } else {
            // - LINEがインストールされていない場合の処理
            let urlString = "itms-apps://itunes.apple.com/app/id443904275"
            let url = NSURL(string: urlString)
            UIApplication.sharedApplication().openURL(url!)
        }
    }
    
    @IBAction func tapInstagramButton(sender: AnyObject) {
        guard let sendImage = self.pictImageView.image else {
            return
        }
        let imageData = UIImageJPEGRepresentation(self.pictImageView.image!, 1.0)
        let temporaryDirectory = NSTemporaryDirectory() as NSString
        let temporaryImagePath = temporaryDirectory.stringByAppendingPathComponent("YourImageFileName.igo")
        _ = imageData!.writeToFile(temporaryImagePath, atomically: true)
        documentInteractionController.URL = NSURL(fileURLWithPath: temporaryImagePath)
        documentInteractionController.UTI = "com.instagram.exclusivegram"
        documentInteractionController.presentOpenInMenuFromRect(
            self.view.bounds,
            inView: self.view,
            animated: true
        )
        
    }
    
    @IBAction func tapTweetButton(sender: AnyObject) {
        guard let sendImage = self.pictImageView.image else {
            return
        }
        let socialVC = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
        socialVC.addImage(sendImage)
        self.presentViewController(socialVC, animated: true, completion: nil)
    }
    
    @IBAction func tapFaceBookButton(sender: AnyObject) {
        guard let sendImage = self.pictImageView.image else {
            return
        }
        let socialVC = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        socialVC.addImage(sendImage)
        self.presentViewController(socialVC, animated: true, completion: nil)
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
