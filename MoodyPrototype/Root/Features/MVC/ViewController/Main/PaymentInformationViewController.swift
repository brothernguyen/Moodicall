//
//  PaymentInformationViewController.swift
//  MoodyPrototype
//
//  Created by Nhoc Con on 6/28/18.
//  Copyright © 2018 Nhoc Con. All rights reserved.
//

import Foundation
import UIKit

class PaymentInformationViewController: UIViewController {
    
    var historyData : [PaymentInformationModel] = []
    
    @IBOutlet weak var nameCardLabel: UILabel!
    @IBOutlet weak var numberCardLabel: UILabel!
    @IBOutlet weak var historyTableView: UITableView!
    
    @IBAction func didTapReplaceCreditCardButton(_ sender: Any) {
        let vc : NewCreditCardViewController = Helper.getViewController(storyboardName: Define.mainStoryboard, identifier: NewCreditCardViewController.getClassName())
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initUI()
    }
    
    func initUI() {
        historyTableView.dataSource = self
        historyTableView.delegate = self
        historyTableView.tableFooterView = UIView()
        
        historyData = Helper.getHistoryPaymentInformation()
        historyTableView.reloadData()
    }
}

extension PaymentInformationViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let data = historyData[indexPath.row]
        (cell.viewWithTag(11) as! UILabel).text = data.Counselor
        (cell.viewWithTag(22) as! UILabel).text = data.Date
        (cell.viewWithTag(33) as! UILabel).text = data.Total
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension PaymentInformationViewController : NewCreditCardViewControllerDelegate {
    func didTapAddCreditCard(creditCard: CreditCardModel) {
        self.nameCardLabel.text = creditCard.name
        self.numberCardLabel.text = creditCard.number
    }
}
