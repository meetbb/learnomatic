//
//  SignUpViewController.swift
//  Learnomatic
//
//  Created by Meet Brahmbhatt on 19/01/21.
//  Copyright © 2021 Logiciél. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        
    }
    
    override func viewDidLayoutSubviews() {
        firstNameTextField.addUnderLine()
        lastNameTextField.addUnderLine()
    }
}
