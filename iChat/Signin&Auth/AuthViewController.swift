//
//  AuthViewController.swift
//  iChat
//
//  Created by Ерхан on 11.03.2024.
//

import UIKit
import GoogleSignIn
import FirebaseCore
import FirebaseAuth

class AuthViewController: UIViewController {

    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo"), contentMode: .scaleAspectFit)
    
    let googleLabel = UILabel(text: "Get started with")
    let emailLabel = UILabel(text: "Or sign up with")
    let alreadyOnBoardLabel = UILabel(text: "Already onboard?")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    let emailButton = UIButton(title: "Email", titleColor: .white, backgroundColor: .buttonDark())
    let loginButton = UIButton(title: "Login", titleColor: .buttonRed(), backgroundColor: .white, isShadow: true)
    
    let signUpVC = SignUpViewController()
    let loginVC = LoginViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        googleButton.customizeGoogleButton()
        view.backgroundColor = .white
        setupConstrains()
        
        emailButton.addTarget(self, action: #selector(emailButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
//        googleButton.addTarget(self, action: #selector(signInWithGoogleAction), for: .touchUpInside)
        
        signUpVC.delegate = self
        loginVC.delegate = self
    }
    
    @objc private func emailButtonTapped() {
        print(#function)
        present(signUpVC, animated: true, completion: nil)
    }
    
    @objc private func loginButtonTapped() {
        print(#function)
        present(loginVC, animated: true, completion: nil)
    }
}

// MARK: - Setup constrains
extension AuthViewController {
    
    private func setupConstrains() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
    
        let googleView = ButtonFormView(label: googleLabel, button: googleButton)
        let emailView = ButtonFormView(label: emailLabel, button: emailButton)
        let loginView = ButtonFormView(label: alreadyOnBoardLabel, button: loginButton)
        
        let stackView = UIStackView(arrangedSubviews: [googleView, emailView, loginView], axis: .vertical, spacing: 40)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(logoImageView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 160),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
    }
}

extension AuthViewController: AuthNavigationDelegate {
    func toLoginVC() {
        present(loginVC, animated: true, completion: nil)
    }
    
    func toSignUpVC() {
        present(signUpVC, animated: true, completion: nil)
    }
}

// MARK: - Google Auth
//extension AuthViewController {
//    
//    @objc private func signInWithGoogleAction() {
//        
//        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
//        
//        
//        let config = GIDConfiguration(clientID: clientID)
//        GIDSignIn.sharedInstance.configuration = config
//        
//        
//        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [weak self] result, error in
//            guard let _ = result, error == nil else { return }
//            
//            guard let user = result?.user, let idToken = user.idToken?.tokenString else { return }
//            
//            AuthService.shared.googleLogin(user: result?.user, error: error) { (result) in
//                switch result {
//                    
//                case .success(let user):
//                    FirestoreService.shared.getUserData(user: user) { (result) in
//                        switch result {
//                            
//                        }
//                case .failure(let error):
//                    self.showAlert(with: "Ошибка", and: error.localizedDescription)
//                }
//            }
//            
//            self?.signInWithGoogle(idToken: idToken, accessToken: user.accessToken.tokenString)
//            
//            
//            
//        }
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
//    
//    
//    
//    
//}
// MARK: - SwiftUI

import SwiftUI
import FirebaseCore

struct AuthVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: Context) -> AuthViewController {
            viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

