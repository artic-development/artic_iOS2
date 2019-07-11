//
//  ModifyProfile.swift
//  Artic
//
//  Created by admin on 06/07/2019.
//  Copyright © 2019 choyi. All rights reserved.
//

import UIKit
import MobileCoreServices

class ModifyProfile: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var profilePicView: UIView!
   
    @IBOutlet weak var changeProfile: UIImageView!
    
    let imagepicker: UIImagePickerController! =  UIImagePickerController()
    var flagImagesave = false
    var CaptureImage: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let radius = profilePicView.frame.width / 2
        profilePicView.makeRounded(cornerRadius: radius)
        
        // Do any additional setup after loading the view.
    }
    

    @IBAction func changePicBtnClicked(_ sender: Any) {
        let alert =  UIAlertController(title: "어디서 가져올까요", message: "선택하세요", preferredStyle: .actionSheet)
        
        let library =  UIAlertAction(title: "사진앨범", style: .default) { (action) in self.openLibrary()
        }
        
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in
            self.openCamera()
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    func openLibrary()
    {
        flagImagesave = false
        
        imagepicker.delegate = self
        imagepicker.sourceType = .photoLibrary
        imagepicker.mediaTypes = [kUTTypeImage as String]
        imagepicker.allowsEditing = true
        present(imagepicker, animated: false, completion: nil)
        
    }
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            flagImagesave = true
            imagepicker.delegate = self
            imagepicker.sourceType = .camera
            imagepicker.mediaTypes = [kUTTypeImage as String]
            imagepicker.allowsEditing = false
            present(imagepicker, animated: false, completion: nil)
        }
        else{
            print("Camera not available")
        }
    }
  
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [ UIImagePickerController.InfoKey: Any]) {
  
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        print(mediaType)
        
        if mediaType.isEqual(to: kUTTypeImage as NSString as String){
            
            CaptureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            if flagImagesave{
                UIImageWriteToSavedPhotosAlbum(CaptureImage, self, nil, nil)
            }
            changeProfile.image = CaptureImage
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
}



