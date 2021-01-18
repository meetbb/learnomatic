//
//  iOSHomeViewController.swift
//  Learnomatic
//
//  Created by Meet Brahmbhatt on 15/01/21.
//  Copyright © 2021 Logiciél. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class iOSHomeViewController: UIViewController {
    
    @IBOutlet weak var loadingImage: UIActivityIndicatorView!
    var ref: DatabaseReference!
    var headerArray = [String]()
    var descArray = [String]()
    @IBOutlet weak var iOSTableView: UITableView!
    
    override func viewDidLoad() {
        ref = Database.database().reference()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if headerArray.count == 0 {
            fetchiOSData()
        }
    }
    
    func fetchiOSData() {
        self.loadingImage.startAnimating()
        ref.child("iOSCategories").observe(.childAdded, with: { (snapshot) in
            let value = snapshot.value
            let key = snapshot.key
            if let actualDesc = value {
                self.headerArray.append(key)
                self.descArray.append(actualDesc as! String)
                self.iOSTableView.reloadData()
//                self.loadingImage.stopAnimating()
            }
        })
    }
}

class iOSTableViewCell : UITableViewCell {
    
    @IBOutlet weak var cellContainerView: UIView!
    @IBOutlet weak var cellHeader: UILabel!
    @IBOutlet weak var cellDescription: UILabel!
}

extension iOSHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.headerArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "iOSTableViewCell", for: indexPath) as! iOSTableViewCell
        cell.cellContainerView.layer.shadowColor = UIColor.lightGray.cgColor
        cell.cellContainerView.layer.shadowOpacity = 0.5
        cell.cellContainerView.layer.shadowOffset = .zero
        cell.cellContainerView.layer.shadowRadius = 5
        cell.cellHeader.text = self.headerArray[indexPath.item]
        cell.cellDescription.text = self.descArray[indexPath.item]
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
