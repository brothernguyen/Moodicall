//
//  ViewController.swift
//  MoodyPrototype
//
//  Created by Nhoc Con on 6/27/18.
//  Copyright © 2018 Nhoc Con. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func didTapLoginButton(_ sender: Any) {
        self.performTapLoginButton()
    }
    
    @IBAction func didTapRegisterButton(_ sender: Any) {
        self.performTapRegisterButton()
    }
    
    var allUsers : [UserModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
        self.allUsers = getAllUser()
    }
    
    func initUI() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        Helper.setColorPlaceHolderTextField(tf: emailTextField, textPlaceHolder: Define.email)
        Helper.setColorPlaceHolderTextField(tf: passwordTextField, textPlaceHolder: Define.password)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// Data Source
extension LoginViewController {
    func performTapLoginButton() {
        let user = UserModel(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
        
        guard Helper.checkValidateUserLogin(user: user) else {
            showAlert(message: "Please enter validate Email and Password", actionOk: nil)
            return
        }
        
        guard checkUser(user: user) else {
            showAlert(message: "This user is not exist", actionOk: nil)
            return
        }
        
        Helper.goToMainViewController(viewController: self)
    }
    
    func performTapRegisterButton() {
//        let vc : RegisterViewController = Helper.getViewController(storyboardName: Define.mainStoryboard, identifier: RegisterViewController.getClassName())
        let vc : PaymentInformationViewController = Helper.getViewController(storyboardName: Define.mainStoryboard, identifier: PaymentInformationViewController.getClassName())
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func getAllUser() -> [UserModel] {
        return Helper.getAllUsers()
    }
    
    func checkUser(user: UserModel) -> Bool {
        if allUsers.contains(where: { (u) -> Bool in
            return u.email == user.email && u.password == user.password
        }) {
            return true
        }
        return false
    }
}
