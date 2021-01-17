//
//  AndroidHomeViewController.swift
//  Learnomatic
//
//  Created by Meet Brahmbhatt on 15/01/21.
//  Copyright © 2021 Logiciél. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class AndroidHomeViewController: UIViewController {
    
    @IBOutlet weak var androidTableView: UITableView!
    @IBOutlet weak var loadingImage: UIActivityIndicatorView!
    var databaseReference : DatabaseReference!
    var headersList = [String]()
    var descList = [String]()
    
    override func viewDidLoad() {
        databaseReference = Database.database().reference()
        getAndroidCategories()
    }
    
    func initLoadingImage() {
//        self.loadingImage = UIActivityIndicatorView(style: .large)
//        self.loadingImage.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        self.loadingImage.hidesWhenStopped = true
    }
    
    func getAndroidCategories() {
        self.loadingImage.startAnimating()
        databaseReference.child("AndroidCategories").observe(.childAdded, with: { (snapshot) in
            let keys = snapshot.key
            let values = snapshot.value
            if let actualValue = values {
                self.headersList.append(keys)
                self.descList.append(actualValue as! String)
                self.androidTableView.reloadData()
                self.loadingImage.stopAnimating()
            }
        })
    }
}

class AndroidTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellContainerView: UIView!
    @IBOutlet weak var cellHeaderText: UILabel!
    @IBOutlet weak var cellDescriptionText: UILabel!
}

extension AndroidHomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headersList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AndroidTableViewCell", for: indexPath) as! AndroidTableViewCell
        cell.cellContainerView.layer.shadowColor = UIColor.lightGray.cgColor
        cell.cellContainerView.layer.shadowOpacity = 0.5
        cell.cellContainerView.layer.shadowOffset = .zero
        cell.cellContainerView.layer.shadowRadius = 5
        cell.cellHeaderText.text = self.headersList[indexPath.item]
        cell.cellDescriptionText.text = self.descList[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
