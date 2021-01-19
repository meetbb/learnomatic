//
//  LoginController.swift
//  Learnomatic
//
//  Created by Meet Brahmbhatt on 19/01/21.
//  Copyright © 2021 Logiciél. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class LoginController : UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        
    }
    
    override func viewDidLayoutSubviews() {
        userNameTextField.addUnderLine()
        passwordTextField.addUnderLine()
    }
}

extension UITextField {
    
    func addUnderLine () {
        let bottomLine = CALayer()
        let width = CGFloat(0.5)
        bottomLine.frame = CGRect(x: 0.0, y: self.frame.size.height - width, width: self.frame.size.width - 10, height: 1.5)
        bottomLine.backgroundColor = UIColor.lightGray.cgColor
        
        self.borderStyle = UITextField.BorderStyle.none
        self.layer.addSublayer(bottomLine)
        self.layer.masksToBounds = true
    }
    
}
