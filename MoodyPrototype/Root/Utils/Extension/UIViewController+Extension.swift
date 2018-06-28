//
//  UIViewController+Extension.swift
//  MoodyPrototype
//
//  Created by Nhoc Con on 6/27/18.
//  Copyright © 2018 Nhoc Con. All rights reserved.
//

import Foundation
import UIKit
import MBProgressHUD

extension UIViewController {
    static func getClassName() -> String {
        return String(describing: self)
    }
    
    func showLoading() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    func hideLoading() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func showAlert(title: String? = Define.message , message: String? = "" , actionOk: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title ?? "", message: message ?? "", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: Define.ok, style: UIAlertActionStyle.default, handler: { (action) in
            actionOk?()
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showPickValue(title: String, values : [String], complete: @escaping ((String) -> Void)) {
        let actionSheetVC = UIAlertController.init(title: title, message: nil, preferredStyle: .actionSheet)
        
        for i in values {
            actionSheetVC.addAction(UIAlertAction(title: i, style: .default, handler: { (action) in
                complete(i)
            }))
        }
        
        self.present(actionSheetVC, animated: true, completion: nil)
    }
}
