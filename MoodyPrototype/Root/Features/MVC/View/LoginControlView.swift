//
//  LoginControlView.swift
//  MoodyPrototype
//
//  Created by Nhoc Con on 6/28/18.
//  Copyright © 2018 Nhoc Con. All rights reserved.
//

import UIKit

protocol LoginControlViewDelegate {
    func didTapLoginButton()
    func didTapSignUpButton()
}

class LoginControlView: UIView {
    
    var delegate : LoginControlViewDelegate?
    
    @IBOutlet var view: UIView!
    
    @IBAction func didTapSignUpButton(_ sender: Any) {
        delegate?.didTapSignUpButton()
    }
    @IBAction func didTapLoginButton(_ sender: Any) {
        delegate?.didTapLoginButton()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        view = Bundle.main.loadNibNamed("LoginControlView", owner: self, options: nil)?.first as! UIView
        self.addSubview(view)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.view.frame = self.bounds
    }
}
