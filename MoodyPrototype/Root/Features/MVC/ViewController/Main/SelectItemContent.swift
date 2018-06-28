//
//  SelectItemContent.swift
//  MoodyPrototype
//
//  Created by Administrator on 6/28/18.
//  Copyright © 2018 Nhoc Con. All rights reserved.
//

import UIKit

class SelectItemContent: UIView,UITableViewDelegate,UITableViewDataSource {

    private var myTableView: UITableView!
    var arrayData:NSMutableArray = NSMutableArray();
    var controller:HomeViewController!
    var typeIndex:Int = 0
    override init(frame: CGRect) {
        super.init(frame: frame)
        
//        self.initData()
    }
    
    func setData(type:Int){
        typeIndex = type;
        if typeIndex == 0 {
            self.initData();
        }else{
            self.initDataMale();
        }
        self.addCustomView()

    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initDataMale(){
        var dataObj = DataSelect();
        dataObj.title = "No Preference";
        dataObj.isSelect = false;
        arrayData.add(dataObj);
        
        dataObj = DataSelect();
        dataObj.title = "Male";
        dataObj.isSelect = false;
        arrayData.add(dataObj);
        
        dataObj = DataSelect();
        dataObj.title = "Female";
        dataObj.isSelect = false;
        arrayData.add(dataObj);
    }
    
    func initData(){
        var dataObj = DataSelect();
        dataObj.title = "Abuse - Abandonment";
        dataObj.isSelect = false;
        arrayData.add(dataObj);
        
        dataObj = DataSelect();
        dataObj.title = "Abuse - Past/Childhood";
        dataObj.isSelect = false;
        arrayData.add(dataObj);
        
        dataObj = DataSelect();
        dataObj.title = "Abuse - Physical";
        dataObj.isSelect = false;
        arrayData.add(dataObj);

        dataObj = DataSelect();
        dataObj.title = "Abuse - Sexual";
        dataObj.isSelect = false;
        arrayData.add(dataObj);
        
        dataObj = DataSelect();
        dataObj.title = "Addiction - Alcohol";
        dataObj.isSelect = false;
        arrayData.add(dataObj);

        dataObj = DataSelect();
        dataObj.title = "Addiction - Pornography";
        dataObj.isSelect = false;
        arrayData.add(dataObj);

        dataObj = DataSelect();
        dataObj.title = "Addiction - Sexual";
        dataObj.isSelect = false;
        arrayData.add(dataObj);
        dataObj = DataSelect();
        dataObj.title = "Addiction - Substance Abuse";
        dataObj.isSelect = false;
        arrayData.add(dataObj);
        dataObj = DataSelect();
        dataObj.title = "Behavior - ADHD";
        dataObj.isSelect = false;
        arrayData.add(dataObj);

        dataObj = DataSelect();
        dataObj.title = "Behavior - Conduct Disorder";
        dataObj.isSelect = false;
        arrayData.add(dataObj);
        
        dataObj = DataSelect();
        dataObj.title = "Bereavement";
        dataObj.isSelect = false;
        arrayData.add(dataObj);
        dataObj = DataSelect();
        dataObj.title = "Coaching - Career";
        dataObj.isSelect = false;
        arrayData.add(dataObj);
        dataObj = DataSelect();
        dataObj.title = "Coaching - Finance";
        dataObj.isSelect = false;
        arrayData.add(dataObj);
    }
    
    func addCustomView() {
        
        let vHeader = UIView.init(frame:CGRect(x: 0, y: 0, width: self.frame.size.width, height: 40))
        
        
        let lblTitle = UILabel.init(frame: vHeader.frame)
        
        lblTitle.text = "Select Item"
        lblTitle.textColor = UIColor.black
        lblTitle.textAlignment = NSTextAlignment.center
        vHeader.addSubview(lblTitle)
        
        
        let vLineHeader = UIView.init(frame: CGRect(x: 0, y: vHeader.frame.size.height-1, width: vHeader.frame.size.width, height: 1))
        
        vLineHeader.backgroundColor = UIColor.init(red: 43/255, green: 155/255, blue: 100/255, alpha: 1);
        vHeader.addSubview(vLineHeader)
        self.addSubview(vHeader)
        
        myTableView = UITableView(frame: CGRect(x: 0, y: vHeader.frame.origin.y + vHeader.frame.size.height + 5, width: frame.size.width, height: frame.size.height-vHeader.frame.size.height))
        
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.tableFooterView = UIView.init(frame: CGRect.zero);

        self.addSubview(myTableView)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "Cell")

        let data:DataSelect = arrayData.object(at: indexPath.row) as! DataSelect
        if data.isSelect {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        cell.textLabel!.text = data.title
        return cell
    }
     func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
            let data = arrayData.object(at: indexPath.row) as! DataSelect
            data.isSelect = false;
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let data = arrayData.object(at: indexPath.row) as! DataSelect
            data.isSelect = true;
            KLCPopup.dismissAllPopups();
            controller.reloadItem(data: data,type: typeIndex);
            
        }
    }
}
