//
//  LoginScreenViewController.swift
//  ComfortZone
//
//  Created by Aung Kyaw Phyo on 25/07/2024.
//

import UIKit
import GoogleSignIn

class LoginScreenViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailErrorLabel: UILabel!
    @IBOutlet weak var passwordErrorLabel: UILabel!
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var facebookBtn: UIButton!
    
    var delegate: LoginScreenProtocols?

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        defaultSetup()
    }
    
    private func defaultSetup() {
        passwordTextField.addVisibleButton()
        textFieldSetup()
        emailTextField.designableIcon(image: UIImage(systemName: "envelope.fill")!)
        passwordTextField.designableIcon(image: UIImage(systemName: "lock.fill")!)
    }
    
    private func textFieldSetup() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }

}

// MARK: Extension
/**
 - Documentation for purpose of extension
 */

// MARK: - UITextFieldDelegate
extension LoginScreenViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == emailTextField {
            emailErrorLabel.text = ""
        } else {
            passwordErrorLabel.text = ""
        }
    }
    
}

// MARK: - /////
extension LoginScreenViewController: LoginScreenProtocols {
    
    func showTextFieldErrorLabel(error: ValidationErrors) {
        if error == .emailError {
            emailErrorLabel.text = error.rawValue
        } else {
            passwordErrorLabel.text = error.rawValue
        }
    }
    
    func clickedOnLoginButtonAction(inputData: LoginRequestModel) {
        if emailTextField.text == "Dev.aungkyawphyo@gmail.com" {
            
        } else if passwordTextField.text == "password" {
            
        }
    }
    
    func baseRouter() {
        let vc = HomeScreenViewController.instantiate(name: .HomeScreenViewController)
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
}

// MARK: - User Interaction - Actions & Targets
extension LoginScreenViewController {
    
    @IBAction func forgotPasswordBtnAction(_ sender: UIButton) {
        
    }
    
    @IBAction func loginBtnAction(_ sender: CustomButton) {
        delegate?.clickedOnLoginButtonAction(inputData: LoginRequestModel(emailAddress: emailTextField.inputValue,
                                                                          password: passwordTextField.inputValue))
        if emailTextField.text == "Dev.aungkyawphyo@gmail.com" && passwordTextField.text == "password" {
            baseRouter()
        } else if emailTextField.text != "Dev.aungkyawphyo@gmail.com" {
            showTextFieldErrorLabel(error: ValidationErrors.emailError)
        } else if passwordTextField.text != "password" {
            showTextFieldErrorLabel(error: ValidationErrors.passwordError)
        }
    }
    
    @IBAction func googleBtnAction(_ sender: UIButton) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { GIDSignInResult, error in
            guard let signInResult = GIDSignInResult else { return }
            let user = signInResult.user
            _ = user.profile?.email
            _ = user.profile?.name
            _ = user.profile?.familyName
            _ = user.profile?.imageURL(withDimension: 320)
            self.baseRouter()
        }
    }
    
    @IBAction func facebookBtnAction(_ sender: UIButton) {
        
    }
    
    @IBAction func registerBtnAction(_ sender: UIButton) {
        
    }
    
}
