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
    @IBOutlet weak var searchTableView: UITableView!
    
    var searchText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //searchKeywordLbl.text = searchText
        searchTableView.dataSource = self
        searchTableView.delegate = self
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        
        return cell
    }   
}

class SearchCell: UITableViewCell {
    
}

