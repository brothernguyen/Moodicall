//
//  Helper.swift
//  MoodyPrototype
//
//  Created by Nhoc Con on 6/27/18.
//  Copyright © 2018 Nhoc Con. All rights reserved.
//

import Foundation
import UIKit

class Helper {
    static func getViewController<T> (storyboardName: String, identifier: String) -> T {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: identifier) as! T
    }
    
    static func checkValidateUserLogin (user: UserModel) -> Bool {
        if user.email == "" || user.password == "" {
            return false
        }
        return true
    }
    
    static func goToMainViewController (viewController: UIViewController) {
        let vc : MainViewController = Helper.getViewController(storyboardName: Define.mainStoryboard, identifier: MainViewController.getClassName())
        viewController.navigationController?.pushViewController(vc, animated: true)
    }
    
    static func setColorPlaceHolderTextField (tf: UITextField, textPlaceHolder: String) {
        tf.attributedPlaceholder = NSAttributedString(string: textPlaceHolder, attributes: [NSAttributedStringKey.foregroundColor: UIColor.lightGray])
    }
}

extension Helper {
    static func getAllUsers() -> [UserModel] {
        var users : [UserModel] = []
        
        guard let data = Define.userDefault.value(forKey: Define.keyAllUser) else {
            return users
        }
        
        guard let dataUserUnarchiver = NSKeyedUnarchiver.unarchiveObject(with: data as! Data) else {
            return users
        }
        
        guard let dataUsers = dataUserUnarchiver as? [UserModel] else {
            return users
        }
        
        users = dataUsers
        return users
    }
    
    static func setUser(user : UserModel) {
        var users = getAllUsers()
        
        if !users.contains(where: { (u) -> Bool in
            return u.email == user.email
        }) {
            users.append(user)
            Define.userDefault.setValue(NSKeyedArchiver.archivedData(withRootObject: users), forKey: Define.keyAllUser)
            Define.userDefault.synchronize()
        }
    }
}

// Fake data
extension Helper {
    static func getHistoryPaymentInformation() -> [PaymentInformationModel] {
        let bundle = Bundle.main
        let path = bundle.path(forResource: "historyJson", ofType: "json")
        let stringJson : String = try! String(contentsOfFile: path!, encoding: String.Encoding.utf8)
        
        let jsonData = stringJson.data(using: String.Encoding.utf8)
        let decode = JSONDecoder()
        return try! decode.decode([PaymentInformationModel].self, from: jsonData!)
    }
    
    static func getListMonth() -> [String] {
        return ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    }
    
    static func getListYear() -> [String] {
        return ["2018", "2019", "2020", "2021", "2022", "2023", "2024", "2025", "2026"]
    }
}
