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
    
    // MARK: Outlets
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var retypePasswordTextField: UITextField!
    @IBOutlet weak var loadingImage: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        
    }
    
    override func viewDidLayoutSubviews() {
        firstNameTextField.addUnderLine()
        lastNameTextField.addUnderLine()
        emailAddressTextField.addUnderLine()
        passwordTextField.addUnderLine()
        retypePasswordTextField.addUnderLine()
    }
    
    
    @IBAction func onRegisterBtnClick(_ sender: UIButton) {
        guard let email = emailAddressTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        self.loadingImage.startAnimating()
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            self.loadingImage.stopAnimating()
            if (error == nil) {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
}
