//
//  takePictureViewController.swift
//  tanakaProject
//
//  Created by 原田　礼朗 on 2016/07/02.
//  Copyright © 2016年 reo harada. All rights reserved.
//

import UIKit

class takePictureViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var pictImageView: UIImageView!
    
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
        self.performSegueWithIdentifier("seeYouLater", sender: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        self.pictImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        self.dismissViewControllerAnimated(true, completion: nil)
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
