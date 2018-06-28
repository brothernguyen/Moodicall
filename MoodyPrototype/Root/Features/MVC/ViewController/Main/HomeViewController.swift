//
//  ViewController.swift
//  Moody
//
//  Created by Anh Tuan Nguyen on 6/27/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0

class HomeViewController: UIViewController {
    
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblSecondItem: UILabel!
    @IBOutlet weak var lblFirstItem: UILabel!
    @IBOutlet weak var viewNowBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    let datePicker = UIDatePicker()
    let dateFormatterGet = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewNowBtn.layer.cornerRadius = 5
        searchBtn.layer.cornerRadius = 5
        dateFormatterGet.dateFormat = "MM/dd/yyyy"
        lblTime.text = dateFormatterGet.string(from: Date())
    }
    
    @IBAction func viewNowBtnPressed(_ sender: UIButton) {
       
    }
    @IBAction func tapSelectItem1(_ sender: Any) {
        showItemWithType(type: 0);
    }
    
    @IBAction func tapSelectItem2(_ sender: Any) {
        showItemWithType(type: 1);
    }
    @IBAction func tapSelectItem3(_ sender: Any) {
        let datePicker = ActionSheetDatePicker(title: "Date:", datePickerMode: UIDatePickerMode.date, selectedDate: Date(), doneBlock: {
            picker, value, index in
            
            self.lblTime.text = self.dateFormatterGet.string(from: value as! Date);
            return
        }, cancel: { ActionStringCancelBlock in return }, origin: self.view)
        datePicker?.minimumDate = Date()
        
        datePicker?.show()
    }
    @objc func datePicked(_ obj: Date) {
//        UIDatePickerModeTime.setTitle(obj.description, for: UIControlState())
    }
    
    func showItemWithType(type:Int){
        let vShowImage = SelectItemContent.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width - 40, height: self.view.frame.size.height - 148))
        vShowImage.backgroundColor = UIColor.white
        vShowImage.layer.cornerRadius = 5.0
        vShowImage.layer.borderColor = UIColor.lightGray.cgColor
        vShowImage.layer.borderWidth = 1.0
        vShowImage.clipsToBounds = true
        vShowImage.controller = self;
        vShowImage.setData(type: type);
        
        let layout = KLCPopupLayoutMake(KLCPopupHorizontalLayout.center, KLCPopupVerticalLayout.center)
        
        let popup = KLCPopup.init(contentView: vShowImage, showType: KLCPopupShowType.bounceInFromTop, dismissType: KLCPopupDismissType.bounceOutToTop, maskType: KLCPopupMaskType.dimmed, dismissOnBackgroundTouch: true, dismissOnContentTouch: false)
        
        popup?.show(with: layout, duration: 0)
    }
    @IBAction func searchBtnPressed(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let searchVC = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        searchVC.searchText = self.searchTextField.text!        
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    func reloadItem(data:DataSelect,type:Int){
        if type == 0 {
            self.lblFirstItem.text = data.title;
        }else{
            self.lblSecondItem.text = data.title;
        }
    }

}

