//
//  RegisterViewController.swift
//  MoodyPrototype
//
//  Created by Nhoc Con on 6/27/18.
//  Copyright © 2018 Nhoc Con. All rights reserved.
//

import Foundation
import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func didTapRegisterButton(_ sender: Any) {
        self.performTapRegisterButton()
    }
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        self.performTapCancelButton()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
    }
    
    func initUI() {
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        Helper.setColorPlaceHolderTextField(tf: nameTextField, textPlaceHolder: Define.username)
        Helper.setColorPlaceHolderTextField(tf: emailTextField, textPlaceHolder: Define.email)
        Helper.setColorPlaceHolderTextField(tf: passwordTextField, textPlaceHolder: Define.password)
        Helper.setColorPlaceHolderTextField(tf: confirmPasswordTextField, textPlaceHolder: Define.confirmPassword)
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// Data source
extension RegisterViewController {
    func performTapRegisterButton() {
        let p1 = passwordTextField.text ?? ""
        let p2 = confirmPasswordTextField.text ?? ""
        
        guard p1 == p2  else  {
            showAlert(message: "Please enter validate Password and Confirm Password", actionOk: nil)
            return
        }
        
        let user = UserModel(email: emailTextField.text ?? "", password: p1)
        
        guard Helper.checkValidateUserLogin(user: user) else {
            showAlert(message: "Please enter validate Email and Password", actionOk: nil)
            return
        }
        
        Helper.setUser(user: user)
        Helper.goToMainViewController(viewController: self)
    }
    
    func performTapCancelButton() {
        self.navigationController?.popViewController(animated: true)
    }
}
