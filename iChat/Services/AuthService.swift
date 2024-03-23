//
//  AuthService.swift
//  iChat
//
//  Created by Ерхан on 16.03.2024.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn

class AuthService {
    
    static let shared = AuthService()
    private let auth = Auth.auth()
    
    func login(email: String?, password: String?, completion: @escaping (Result<User, Error>) -> Void) {
        
        guard let email = email, let password = password else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        auth.signIn(withEmail: email, password: password) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            completion(.success(result.user))
        }
    }
    
//    func googleLogin(user: GIDGoogleUser!, error: Error!, completion: @escaping (Result<User, Error>) -> Void) {
//        if let error = error {
//            completion(.failure(error))
//            return
//        }
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//        
//        
//        let config = GIDConfiguration(clientID: clientID)
//        GIDSignIn.sharedInstance.configuration = config
//        
//        guard let userToken = user.idToken?.tokenString else { return }
//        
//        Auth.auth().signIn(withCustomToken: userToken) { (result, error) in
//            guard let result = result else {
//                completion(.failure(error!))
//                return
//            }
//            completion(.success(result.user))
//        }
//        
//    }
//    
//    private func signInWithGoogle(idToken: String, accessToken: String) {
//        
//        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
//        Auth.auth().signIn(with: credential) { result, error in
//            guard let _ = result, error == nil else { return }
//            
//        }
//            
//    }
    
    func register(email: String?, password: String?, confirmPassword: String?, completion: @escaping (Result<User, Error>) -> Void) {
        
        guard Validators.isFilled(email: email, password: password, confirmPassword: confirmPassword) else {
            completion(.failure(AuthError.notFilled))
            return
        }
        
        guard password!.lowercased() == confirmPassword!.lowercased() else {
            completion(.failure(AuthError.passwordNotMatched))
            return
        }
        
        guard Validators.isSimpleEmail(email!) else {
            completion(.failure(AuthError.invalidEmail))
            return
        }
        
        auth.createUser(withEmail: email!, password: password!) { (result, error) in
            guard let result = result else {
                completion(.failure(error!))
                return
            }
            
            completion(.success(result.user))
        }
    }
}

