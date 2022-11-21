//
//  CommonNavigationController.swift
//  Carrier
//
//  Created by Siddu Lakshmi Keerthana on 21/11/22.
//

import UIKit

class CommonNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .done, target: self, action: #selector(addTapped))
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: signout
    
    @objc func addTapped(sender: UIBarButtonItem) {
        let signUpManager = FirebaseAuthManager()
        signUpManager.signOut()
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
           let nextViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        nextViewController.emailTextField.text = ""
        nextViewController.passwordTextField.text = ""
        self.popToViewController(nextViewController, animated: false)
    }
    
}
