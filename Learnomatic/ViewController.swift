//
//  ViewController.swift
//  Learnomatic
//
//  Created by Meet Brahmbhatt on 13/01/21.
//  Copyright © 2021 Logiciél. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import SCLAlertView

class ViewController: UIViewController {

    @IBOutlet weak var googleSignInButton: GIDSignInButton!
        
    // MARK: Global Variables
//    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
//        ref = Database.database().reference()
    }
    
    @IBAction func signInWithGoogle(_ sender: GIDSignInButton) {
//        GIDSignIn.sharedInstance()?.signIn()
//        showSimpleAlert(userName: "Meet Brahmbhatt")
//        SCLAlertView().showInfo("Important info", subTitle: "You are great")
        let appearance = SCLAlertView.SCLAppearance(
            showCircularIcon: true
        )
        let alertView = SCLAlertView(appearance: appearance)
        let alertViewIcon = UIImage(named: "iOSIcon") //Replace the IconImage text with the image name
//        alertView.showInfo("Custom icon", subTitle: "This is a nice alert with a custom icon you choose", circleIconImage: alertViewIcon)
        alertView.showSuccess("Success", subTitle: "The order is processed.", circleIconImage: alertViewIcon)
    }
}

extension ViewController: GIDSignInDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print("\(error.localizedDescription)")
            return
        }
        guard user.authentication != nil else {
            return
        }
        let credential = GoogleAuthProvider.credential(withIDToken: user.authentication.idToken, accessToken: user.authentication.accessToken)
        print("Credential Provider are\(credential.provider)")
        print("User Details are: Name: \(String(describing: user.profile.name)) ID is: \(String(describing: user.userID)) Emails is: \(String(describing: user.profile.email))")
        let userName: String = user.profile.name
        showSimpleAlert(userName: userName)
    }
    
    func showSimpleAlert(userName: String) {
        let alert = UIAlertController(title: "Learnomatic", message: "Welcome, \(String(describing: userName)) to these exciting journey of learning new technology.", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Take me in", style: UIAlertAction.Style.default, handler: { _ in
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let homeTabController = storyBoard.instantiateViewController(withIdentifier: "homeTabBarController") as! UITabBarController
            homeTabController.modalPresentationStyle = .fullScreen
            homeTabController.selectedIndex = 0
                    self.present(homeTabController, animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
