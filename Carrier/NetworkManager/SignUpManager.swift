//
//  SignUpManager.swift
//  Carrier
//
//  Created by Siddu Lakshmi Keerthana on 19/11/22.
//
import FirebaseAuth
import Foundation

class FirebaseAuthManager {
    
    func isUserLoggedIn() -> Bool {
        return Auth.auth().currentUser != nil
    }
    
    func signOut(){
        do {
            try Auth.auth().signOut()
        } catch {
            print("Sign out error")
        }
    }
    //MARK: CREATE USER
    func createUser(email: String, password: String, success: @escaping (_ success: Bool)-> Void, failure: @escaping (_ success: Bool,_ message:String) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
            if error != nil{
                let err = error! as NSError
                var message = ""
                
                switch err.code {
                case AuthErrorCode.invalidEmail.rawValue:
                    message = "Invalid Email"
                    break
                case AuthErrorCode.weakPassword.rawValue:
                    message = "weak Password"
                    break
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    message = "email already In use"
                    break
                default:
                    print("Error: \(err.localizedDescription)")
                }
                
                failure(false,message)
                
            } else {
                success(true)
            }
            
        }
    }
    
    //MARK: SIGNIN USER
    func signIn(email: String, pass: String, success: @escaping (_ success: Bool)-> Void, failure: @escaping (_ success: Bool,_ message:String) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) { (result, error) in
            if error != nil {
                let err = error! as NSError
                var message = ""
                switch err.code {
                case AuthErrorCode.invalidEmail.rawValue:
                    message = "invalid email"
                    break
                case AuthErrorCode.wrongPassword.rawValue:
                    message = "wrong password"
                    break
                case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                    message = "accountExistsWithDifferentCredential"
                    break
                default:
                    print("unknown error: \(err.localizedDescription)")
                }
                failure(false, message)
            } else {
                success(true)
            }
        }
    }
    
    //MARK: PASSWORD RESET
    func passwordReset(email:String,success: @escaping (_ success: Bool)-> Void, failure: @escaping (_ success: Bool,_ message:String) -> Void){
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error != nil{
                let err = error! as NSError
                var message = ""
                
                switch err.code {
                case AuthErrorCode.unverifiedEmail.rawValue:
                    message = "Unverified Email"
                    break
                default:
                    print("Error: \(err.localizedDescription)")
                }
                
                failure(false,message)
                
            }  else {
                print("Reset password email has been successfully sent")
                success(true)
            }
        }
    }
}
