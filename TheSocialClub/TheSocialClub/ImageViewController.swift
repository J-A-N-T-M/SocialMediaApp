//
//  ImageViewController.swift
//  TheSocialClub
//
//  Created by Tashiana Johnson on 4/18/22.
//


import UIKit
import Parse

struct APIResponse: Codable{
    let total: Int
    let total_pages: Int
    let results: [Result]
}

struct Result: Codable{
    let id:String
    let urls: URLS
}

struct URLS: Codable{
    let regular:String
}
 

class ImageViewController: UIViewController, UICollectionViewDataSource, UISearchBarDelegate{


    private var collectionView: UICollectionView?
    var results: [Result] = []
    let searchbar = UISearchBar()
    let profile = PFObject(className: "Profile")

    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.delegate = self
        view.addSubview(searchbar)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.size.width/2,
                                 height: view.frame.size.width/2)
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.register( ImageCollectionViewCell.self,
                                 forCellWithReuseIdentifier: ImageCollectionViewCell.identifier)
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.backgroundColor = .systemBackground
        self.collectionView = collectionView
        
        // Do any additional setup after loading the view.
    }
    
     override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
         searchbar.frame = CGRect(x: 10, y: view.safeAreaInsets.top, width: view.frame.size.width-20, height:50)
         
         collectionView?.frame = CGRect(x: 10, y:view.safeAreaInsets.top+55, width: view.frame.size.width, height: view.frame.size.height-55)
     }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchbar.resignFirstResponder()
        if let text = searchBar.text{
            results = []
            collectionView?.reloadData()
            fetchPhotos(query: text)
        }
    }
    
    func fetchPhotos(query: String) {
        let urlString = "https://api.unsplash.com/search/photos?page=1&per_page=50&query=\(query)&client_id=Tygs02x-9ux7zxhL3_UnTqjkQYp4ITdd9c-qOBmkd7E"

        guard let url = URL(string: urlString) else{
            return
        }
            let task = URLSession.shared.dataTask(with: url) {[weak self] data,_, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let jsonResult = try JSONDecoder().decode(APIResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.results = jsonResult.results
                    self?.collectionView?.reloadData()
                }
                
            }
            catch{
                print(error)
            }
            print("Got data!")
        }
        task.resume()
    }
    
    
    
    
    func collectionView(_ collectView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return results.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let imageURLString = results[indexPath.row].urls.regular
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath) as? ImageCollectionViewCell else {return UICollectionViewCell()}
        cell.configure(with: imageURLString)
        return cell
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
