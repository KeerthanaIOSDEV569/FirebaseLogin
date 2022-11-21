//
//  LoginViewModel.swift
//  Carrier
//
//  Created by Siddu Lakshmi Keerthana on 20/11/22.
//

import Foundation
import UIKit
class LoginViewModel{
    
    func signInRequest(vc:LoginViewController){
        
        let signUpManager = FirebaseAuthManager()
        if let email = vc.emailTextField.text, let password = vc.passwordTextField.text {
            signUpManager.signIn(email: email, pass: password) { success in
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                   let nextViewController = storyBoard.instantiateViewController(withIdentifier: "HomeTabBar") as! UITabBarController
                if let navigator = vc.navigationController {
                            navigator.pushViewController(nextViewController, animated: true)
                        }
            } failure: { success, message in
                                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                vc.display(alertController: alertController)
            }
        }
    }
    
    func forgetPasswordRequest(vc:LoginViewController){
        let signUpManager = FirebaseAuthManager()
        if vc.emailTextField.text != ""{
            signUpManager.passwordReset(email: vc.emailTextField.text!) { success in
                let alertController = UIAlertController(title: nil, message: "instructions sent to email", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                vc.display(alertController: alertController)
                
            } failure: { success, message in
                let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                vc.display(alertController: alertController)
            }

        }else{
            let alertController = UIAlertController(title: nil, message: "enter email for forgetPassword", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            vc.display(alertController: alertController)
        }
        
        
    }
    
}
