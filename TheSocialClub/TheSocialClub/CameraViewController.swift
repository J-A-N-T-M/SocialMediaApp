//
//  CameraViewController.swift
//  TheSocialClub
//
//  Created by Tashiana Johnson on 4/19/22.
//

import UIKit
import Foundation
import AlamofireImage
import Parse


class CameraViewController: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate{

        @IBOutlet weak var imageView: UIImageView!
        @IBOutlet weak var profileAboutField: UITextField!
        @IBOutlet weak var profileInterestField: UITextField!
    
    
    
     override func viewDidLoad(){
        super.viewDidLoad()
        
    }

    @IBAction func onSubmitButton(_ sender: Any){
        let profile = PFObject(className: "Profile")
        
        profile["UserName"] = PFUser.current()!
        profile["AboutUser"] = profileAboutField.text!
        profile["Interests"] = profileInterestField.text!
        
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        
        profile["ProfilePicture"] = file
        
        profile.saveInBackground{(success, error) in
            if success{
                self.dismiss(animated: true, completion: nil)
                print("saved!")
                //self.performSegue(withIdentifier: "SavedProfileSegue", sender: nil)
                }
                else {
                    print("error!")
                }
            }
        
        }
    
    

    @IBAction func onCameraButton(_ sender: Any) {
       
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else{
            picker.sourceType = .photoLibrary
        }
        
        
        present(picker,animated: true, completion: nil)
        
        
    }
    
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
            let image = info[.editedImage] as! UIImage
            
            let size = CGSize(width: 300, height: 300)
            let scaledImage = image.af_imageScaled(to: size)
            
            imageView.image = scaledImage
            dismiss(animated: true, completion: nil)
        }
    

}
