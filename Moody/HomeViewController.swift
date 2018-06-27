//
//  ViewController.swift
//  Moody
//
//  Created by Anh Tuan Nguyen on 6/27/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var viewNowBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewNowBtn.layer.cornerRadius = 5
        searchBtn.layer.cornerRadius = 5
    }
    
    @IBAction func viewNowBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func searchBtnPressed(_ sender: UIButton) {
    }
    
}

