//
//  AccountViewController.swift
//  TheSocialClub
//
//  Created by Nubia Johnson on 4/17/22.
//

import UIKit
import Parse
import AlamofireImage


class AccountViewController: UIViewController {
    
    @IBOutlet weak var profileAboutField: UILabel!
    @IBOutlet weak var profileInterestField: UILabel!
    @IBOutlet weak var profilePictureImageView: UIImageView!
    @IBOutlet weak var profileCoverImageView: UIImageView!

    

    @IBOutlet var AboutMeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let profile = PFObject(className:"Profile")
        //let user = profile["UserName"]
       // let query = profile[ObjectIdentifier] : "iLK47pB2oj"
        
        //let query = profile.object(forKey: "iLK47pB2oj")
        
        
        profileAboutField.text = "I am a senior in college and I enjoy exploring new things!"
        profileInterestField.text = "DJ \n Basketball \n Digital Art \n  "
//        let imageFile = profile["image"] as! PFFileObject
//        let urlString = imageFile.url!
//        let url = URL(string: urlString)!
//        
//        profilePictureImageView.image = photoView.af_setImage(withURL: url)
    
//        query.includeKey("User")
//        query.limit = 1
//        query.findObjectsInBackground{
//            (profile, error) in
//            if profile != nil{
//                self.profile = profile
//                self.tableView.reloadData()            }
//        }
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! ProfileCell
//        let profile = profile[indexPath.row]
//        cell.profileAboutLabel.text = profile["AboutUser"] as! String
//        cell.profileInterestField.text = profile["Interests"] as! String
//        let imageFile = profile["image"] as! PFFileObject
//        let urlString = imageFile.url!
//        let url = URL(string: urlString)!
//
//        cell.photoView.af_setImage(withURL: url)
//
//        return cell
//    }

    }
    
    @IBSegueAction func onCameButton(_ coder: NSCoder) -> CameraViewController? {
        performSegue(withIdentifier: "CameraSegue", sender: nil)
        return CameraViewController(coder: coder)
    }
    
//    @IBAction func onCameraButton(_ sender: Any) {
//            performSegue(withIdentifier: "CameraSegue", sender: nil)
//            
//        }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

