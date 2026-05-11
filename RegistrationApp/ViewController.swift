//
//  ViewController.swift
//  RegistrationApp
//
//  Created by Егор Халиков on 10.05.2026.
//

import UIKit

class ViewController: UIViewController {
    
    private let build = ViewBuilder.shared
    private var contentView = UIView()
    private let emailTextField = UITextField()
    private let passwordTextField = UITextField()
    private var emailStack = UIStackView()
    private var passwordStack = UIStackView()
    private var forgotBtn = UIButton()
    private var signInBtn = UIButton()
    private var orTitle = UILabel()
    private var btnsStack = UIStackView()
    private var signUpStack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appPurple
        
        setBannerImage()
        setContentView()
        setEmailTextView()
        setForgotBtn()
        
        setSignInBtn()
        setOrLabel()
        setAuthBtns()
        setSignUpText()
    }

    private func setBannerImage() {
        let bannerImage = build.bannerImage
        view.addSubview(bannerImage)
        bannerImage.image = .baner
        NSLayoutConstraint.activate([
            bannerImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bannerImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18)
        ])
    }
    
    private func setContentView() {
        contentView = build.contentView
        view.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    private func setEmailTextView() {
        emailStack = build.getTextView(textField: emailTextField, placeholder: "Email Adress")
        passwordStack = build.getTextView(textField: passwordTextField, placeholder: "Password", isPassword: true)
        contentView.addSubview(emailStack)
        contentView.addSubview(passwordStack)
        
        NSLayoutConstraint.activate([
            emailStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            emailStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            emailStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
            
            passwordStack.topAnchor.constraint(equalTo: emailStack.bottomAnchor, constant: 20),
            passwordStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            passwordStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35)
        ])
        
    }
    
    private func setForgotBtn() {
        forgotBtn = build.forgotPassword
        contentView.addSubview(forgotBtn)
        
        NSLayoutConstraint.activate([
            forgotBtn.topAnchor.constraint(equalTo: passwordStack.bottomAnchor, constant: 7),
            forgotBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35)
        ])
    }
    
    private func setSignInBtn() {
        signInBtn = build.signInBtn
        contentView.addSubview(signInBtn)
        
        NSLayoutConstraint.activate([
            signInBtn.topAnchor.constraint(equalTo: forgotBtn.bottomAnchor, constant: 30),
            signInBtn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35),
            signInBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -35),
        ])
    }
    
    private func setOrLabel() {
        orTitle = build.orTitle
        contentView.addSubview(orTitle)
        
        NSLayoutConstraint.activate([
            orTitle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            orTitle.topAnchor.constraint(equalTo: signInBtn.bottomAnchor, constant: 30)
        ])
        
    }
    
    private func setAuthBtns() {
        btnsStack = build.getAuthBtns()
        contentView.addSubview(btnsStack)
        
        NSLayoutConstraint.activate([
            btnsStack.topAnchor.constraint(equalTo: orTitle.bottomAnchor, constant: 30),
            btnsStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 80),
            btnsStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -80),
        ])
    }
    
    private func setSignUpText() {
        signUpStack = build.signUpText
        contentView.addSubview(signUpStack)
        
        NSLayoutConstraint.activate([
            signUpStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            signUpStack.topAnchor.constraint(equalTo: btnsStack.bottomAnchor, constant: 50),
            signUpStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30)
        ])
    }
    
}

