//
//  NewCreditCardViewController.swift
//  MoodyPrototype
//
//  Created by Nhoc Con on 6/28/18.
//  Copyright © 2018 Nhoc Con. All rights reserved.
//

import Foundation
import UIKit

protocol NewCreditCardViewControllerDelegate {
    func didTapAddCreditCard(creditCard: CreditCardModel)
}

class NewCreditCardViewController: UIViewController {
    
    var delegate : NewCreditCardViewControllerDelegate?
    
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var creditCardNumberTextField: UITextField!
    @IBOutlet weak var cvcTextField: UITextField!
    
    @IBAction func didTapAddCardButton(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let creditNumber = creditCardNumberTextField.text ?? ""
        let cvc = cvcTextField.text ?? ""
        let year = yearLabel.text ?? ""
        let month = monthLabel.text ?? ""
        
        if name == "" || creditNumber == "" {
            showAlert(message: "Please enter Name and Credit Number", actionOk: {
                return
            })
            return
        }
        
        let model = CreditCardModel(name: name, number: creditNumber, cvc: cvc, expirationMonth: month, expirationYear: year)
        self.navigationController?.popViewController(animated: true)
        self.delegate?.didTapAddCreditCard(creditCard: model)
    }
    
    @IBAction func didTapMonthView(_ sender: Any) {
        showPickValue(title: "", values: Helper.getListMonth()) { (month) in
            self.monthLabel.text = month
        }
    }
    
    @IBAction func didTapYearView(_ sender: Any) {
        showPickValue(title: "", values: Helper.getListYear()) { (year) in
            self.yearLabel.text = year
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension NewCreditCardViewController {
}
