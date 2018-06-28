//
//  User.swift
//  MoodyPrototype
//
//  Created by Nhoc Con on 6/27/18.
//  Copyright © 2018 Nhoc Con. All rights reserved.
//

import Foundation

class UserModel: NSObject, NSCoding {
    let keyEmail = "email"
    let keyPassword = "password"
    
    var email: String
    var password: String
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.email = aDecoder.decodeObject(forKey: keyEmail) as? String ?? ""
        self.password = aDecoder.decodeObject(forKey: keyPassword) as? String ?? ""
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.email, forKey: keyEmail)
        aCoder.encode(self.password, forKey: keyPassword)
    }
}
