//
//  SearchViewController.swift
//  TheSocialClub
//
//  Created by Jasmine Makombe on 4/18/22.
//

import UIKit
import Parse

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //querySomething()
    }
    
    func querySomething(){
        let query = PFQuery(className:"Groups")
        query.whereKey("category", equalTo:"Harry Potter")
        query.findObjectsInBackground { (objects: [PFObject]?, error: Error?) in
            if let error = error {
                // Log details of the failure
                print(error.localizedDescription)
            } else if let objects = objects {
                // The find succeeded.
                print("Successfully retrieved \(objects.count) groups.")
                // Do something with the found objects
                for object in objects {
                    print(object.updatedAt as Any)
                }
            }
        }
    }
    
    
    @IBAction func onNewGroupButton(_ sender: Any) {
        //performSegue(withIdentifier: "newGroupSegue", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
