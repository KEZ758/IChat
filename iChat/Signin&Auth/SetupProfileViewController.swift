//
//  SetupProfileViewController.swift
//  RChat
//
//  Created by Ерхан on 12.03.2024.
//

import UIKit

class SetupProfileViewController: UIViewController {
    
    let welcomeLabel = UILabel(text: "Set up profile!", font: .avenir26())
    
    let fullNameLabel = UILabel(text: "Full name")
    let aboutMeLabel = UILabel(text: "About me")
    let sexLabel = UILabel(text: "Sex")
    
    let fullNameTExtField = OneLineTextField(font: .avenir20())
    let aboutMeTExtField = OneLineTextField(font: .avenir20())
    let sexSegmentedControl = UISegmentedControl(first: "Male", second: "Femael")
    
    let goToChatsButton = UIButton(title: "Go to chats!", titleColor: .white, backgroundColor: .buttonDark(), cornerRadius: 4)
    
    let fullImageView = AddPhotoView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupConstrains()
    }
}

// MARK: - Setup Constrins
extension SetupProfileViewController {
    private func setupConstrains() {
        let fullNameStackView = UIStackView(arrangedSubviews: [fullNameLabel,
                                                               fullNameTExtField],
                                            axis: .vertical, 
                                            spacing: 0)
        let aboutMeStackView = UIStackView(arrangedSubviews: [aboutMeLabel,
                                                               aboutMeTExtField],
                                            axis: .vertical, 
                                           spacing: 0)
        let sexStackView = UIStackView(arrangedSubviews: [sexLabel,
                                                               sexSegmentedControl],
                                            axis: .vertical, 
                                       spacing: 12)
        
        goToChatsButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        let stackView = UIStackView(arrangedSubviews: [
        fullNameStackView,
        aboutMeStackView,
        sexStackView,
        goToChatsButton
        ],
                                    axis: .vertical,
                                    spacing: 40)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        fullImageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLabel)
        view.addSubview(fullImageView)
        view.addSubview(stackView)
        
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            fullImageView.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 40),
            fullImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: fullImageView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
    }
}

// MARK: - SwiftUI

import SwiftUI

struct SetupProfileVCProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        let setupProfileVC = SetupProfileViewController()
        
        func makeUIViewController(context: Context) -> SetupProfileViewController {
            setupProfileVC
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
