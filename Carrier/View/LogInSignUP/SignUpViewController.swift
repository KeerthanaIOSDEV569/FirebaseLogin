//
//  SignUpViewController.swift
//  Carrier
//
//  Created by Siddu Lakshmi Keerthana on 19/11/22.
//

import UIKit
import FirebaseCore

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var viewModel = SignUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        passwordTextField.isSecureTextEntry = true

        
        // Do any additional setup after loading the view.
    }
    /// SIGNUP ACTION
    @IBAction func signupAction(_ sender: Any) {
        viewModel.signUpRequest(vc: self)
    }
    /// CANCEL ACTION
    @IBAction func cancelAction(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    func display(alertController:UIAlertController){
        self.present(alertController, animated: true, completion: nil)
    }
}



