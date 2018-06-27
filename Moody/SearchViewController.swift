//
//  SearchViewController.swift
//  Moody
//
//  Created by Tuan Anh on 6/27/18.
//  Copyright © 2018 com. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchKeywordLbl: UILabel!
    var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchKeywordLbl.text = searchText
    }    
    
}
