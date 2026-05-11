//
//  ViewBuilder.swift
//  RegistrationApp
//
//  Created by Егор Халиков on 10.05.2026.
//

import UIKit

class ViewBuilder {
    
    static let shared = ViewBuilder()
    
    private init() {}
    
    lazy var bannerImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalToConstant: 178).isActive = true
        image.heightAnchor.constraint(equalToConstant: 178).isActive = true
        return image
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 50
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    lazy var forgotPassword: UIButton = {
        let btn = UIButton(primaryAction: UIAction(handler: { _ in
            print("Forgot password")
        }))
        btn.setTitle("Forgot Password?", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        btn.setTitleColor(.gray, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var signInBtn: UIButton = {
        let btn = UIButton(primaryAction: UIAction(handler: { _ in
            print("Sign In")
        }))
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        btn.backgroundColor = .appYellow
        btn.layer.cornerRadius = 15
        btn.setTitle("Log In", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    lazy var orTitle: UILabel = {
        let label = UILabel()
        label.text = "Or"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var signUpText: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 2
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        var text: UILabel {
            let text = UILabel()
            text.text = "Don't have an account?"
            text.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            return text
        }
        
        var btn: UIButton {
            let btn = UIButton(primaryAction: UIAction(handler: { _ in
                print("Sign Up")
            }))
            btn.setTitle("Sign Up", for: .normal)
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            btn.setTitleColor(.appYellow, for: .normal)
            return btn
        }
        
        stack.addArrangedSubview(text)
        stack.addArrangedSubview(btn)
        
        return stack
    }()
    
    func getTextView(textField: UITextField, placeholder: String, isPassword: Bool = false) -> UIStackView{
        
        lazy var hidePassword: UIButton = {
            let btn = UIButton(primaryAction: action)
            btn.setImage(UIImage(systemName: "eye"), for: .normal)
            btn.tintColor = .black
            btn.translatesAutoresizingMaskIntoConstraints = false
            return btn
        }()
        
        lazy var action = UIAction { _ in
            textField.isSecureTextEntry.toggle()
            
            if textField.isSecureTextEntry {
                hidePassword.setImage(UIImage(systemName: "eye"), for: .normal)
            } else {
                hidePassword.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            }
        }
        
        lazy var placeholderText: UIView = {
            let text = UILabel()
            text.translatesAutoresizingMaskIntoConstraints = false
            text.text = placeholder
            text.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
            text.textColor = .gray
            
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(text)
            view.heightAnchor.constraint(equalToConstant: 15).isActive = true
            
            text.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 19).isActive = true
            
            return view
        }()
        
        lazy var fieldView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            textField.translatesAutoresizingMaskIntoConstraints = false
            textField.isSecureTextEntry = isPassword
            view.addSubview(textField)
            view.backgroundColor = .appGray
            view.layer.cornerRadius = 15
            
            NSLayoutConstraint.activate([
                view.heightAnchor.constraint(equalToConstant: 52),
                textField.topAnchor.constraint(equalTo: view.topAnchor),
                textField.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
                textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
            ])
            
            if isPassword {
                view.addSubview(hidePassword)
                hidePassword.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
                hidePassword.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            }
            
            return view
        }()
        
        lazy var hStack: UIStackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.spacing = 7
            stack.translatesAutoresizingMaskIntoConstraints = false
            
            stack.addArrangedSubview(placeholderText)
            stack.addArrangedSubview(fieldView)
            
            return stack
        }()
        
        return hStack
        
    }
    
    func getAuthBtns() -> UIStackView {
        
        let btns: [UIImage] = [.goog, .app, .fb]
        
        var hStack: UIStackView {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .equalSpacing
            stack.alignment = .center
            stack.translatesAutoresizingMaskIntoConstraints = false
            
            btns.forEach { icon in
                let btn = getAuthBtn(icon: icon)
                stack.addArrangedSubview(btn)
            }
            
            return stack
        }
        
        
        return hStack
    }
    
    private func getAuthBtn(icon: UIImage) -> UIButton {
        lazy var btn: UIButton = {
            let btn = UIButton()
            btn.translatesAutoresizingMaskIntoConstraints = false
            btn.widthAnchor.constraint(equalToConstant: 60).isActive = true
            btn.heightAnchor.constraint(equalToConstant: 60).isActive = true
            btn.backgroundColor = .appGray
            btn.layer.cornerRadius = 15
            btn.setImage(icon, for: .normal)
            return btn
        }()
        
        return btn
    }
    
}
