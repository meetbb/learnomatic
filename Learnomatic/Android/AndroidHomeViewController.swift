//
//  AndroidHomeViewController.swift
//  Learnomatic
//
//  Created by Meet Brahmbhatt on 15/01/21.
//  Copyright © 2021 Logiciél. All rights reserved.
//

import Foundation
import UIKit

class AndroidHomeViewController: UIViewController {
    
    override func viewDidLoad() {
        
    }
}

class AndroidTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellContainerView: UIView!
    @IBOutlet weak var cellHeaderText: UILabel!
    @IBOutlet weak var cellDescriptionText: UILabel!
}

extension AndroidHomeViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AndroidTableViewCell", for: indexPath) as! AndroidTableViewCell
        cell.cellContainerView.layer.shadowColor = UIColor.lightGray.cgColor
        cell.cellContainerView.layer.shadowOpacity = 0.5
        cell.cellContainerView.layer.shadowOffset = .zero
        cell.cellContainerView.layer.shadowRadius = 5
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
