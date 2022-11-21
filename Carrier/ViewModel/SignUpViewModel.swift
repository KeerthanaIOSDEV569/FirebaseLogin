//
//  SignUpViewModel.swift
//  Carrier
//
//  Created by Siddu Lakshmi Keerthana on 20/11/22.
//

import Foundation
import UIKit

class SignUpViewModel{
    
    func signUpRequest(vc:SignUpViewController){
        let signUpManager = FirebaseAuthManager()
        signUpManager.createUser(email:vc.emailTextField.text!, password: vc.passwordTextField.text!) { success in
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



