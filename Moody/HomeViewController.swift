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
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewNowBtn.layer.cornerRadius = 5
        searchBtn.layer.cornerRadius = 5
    }
    
    @IBAction func viewNowBtnPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func searchBtnPressed(_ sender: UIButton) {        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let searchVC = storyboard.instantiateViewController(withIdentifier: "SearchViewController") as! SearchViewController
        searchVC.searchText = self.searchTextField.text!        
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
}

