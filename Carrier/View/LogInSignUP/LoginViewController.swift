//
//  LoginViewController.swift
//  Carrier
//
//  Created by Siddu Lakshmi Keerthana on 19/11/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    /// Outlet properties
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.backItem?.titleView?.isHidden = true
        passwordTextField.isSecureTextEntry = true
        emailTextField.placeholder = NSLocalizedString("userName", comment: "")
        passwordTextField.placeholder = NSLocalizedString("password", comment: "")


    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailTextField.text = ""
        passwordTextField.text = ""
        self.passwordTextField.resignFirstResponder()
    }
    
    @IBAction func signInAction(_ sender: Any) {
        viewModel.signInRequest(vc: self)
    }
    
    @IBAction func forgetPassword(_ sender: Any) {
        viewModel.forgetPasswordRequest(vc: self)
    }

    func display(alertController:UIAlertController){
        self.present(alertController, animated: true, completion: nil)
    }
}
