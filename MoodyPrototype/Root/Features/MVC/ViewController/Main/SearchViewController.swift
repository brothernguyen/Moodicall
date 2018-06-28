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
    
    @IBAction func profileBtnPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Profile", bundle: nil)
        let searchVC = storyboard.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        
        navigationController?.pushViewController(searchVC, animated: true)
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
    
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var time1: UIButton!
    @IBOutlet weak var time2: UIButton!
    @IBOutlet weak var price1: UILabel!
    @IBOutlet weak var price2: UILabel!
    @IBOutlet weak var profileBtn: UIButton!
    
    override func awakeFromNib() {
        time1.layer.cornerRadius = 5
        time2.layer.cornerRadius = 5
    }
    
    
    
    
}

