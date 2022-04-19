//
//  SearchViewController.swift
//  TheSocialClub
//
//  Created by Jasmine Makombe on 4/18/22.
//

import UIKit
import Parse

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var groupsTableView: UITableView!
    
    var groups = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //querySomething()
    }
    
    /*
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
                    print(object as Any)
                }
            }
        }
    }
    */
    
    @IBAction func onNewGroupButton(_ sender: Any) {
        //performSegue(withIdentifier: "newGroupSegue", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        groups.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = groupsTableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as! GroupCell
        
        let group = groups[indexPath.row]
        let groupOwner = group["owner"] as! PFUser
        cell.groupOwnerLabel.text = groupOwner.username
        cell.groupNameLabel.text = group["groupname"] as? String
        
        
        return cell
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Groups")
        query.includeKey("owner")
        query.limit = 20
        
        query.findObjectsInBackground { groups, error in
            if groups != nil{
                self.groups = groups!
                self.groupsTableView.reloadData()
            }
        }
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
