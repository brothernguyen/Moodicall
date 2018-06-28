//
//  CreditCardModel.swift
//  MoodyPrototype
//
//  Created by Nhoc Con on 6/28/18.
//  Copyright © 2018 Nhoc Con. All rights reserved.
//

import Foundation

class CreditCardModel {
    var name = ""
    var number = ""
    var cvc = ""
    var expirationMonth = ""
    var expirationYear = ""
    
    init(name: String, number: String, cvc: String, expirationMonth: String, expirationYear: String) {
        self.name = name
        self.number = number
        self.cvc = cvc
        self.expirationYear = expirationYear
        self.expirationMonth = expirationMonth
    }
}
