//
//  LoginViewController.swift
//  Projeto Lojas
//
//  Created by Matheus de Paula on 21/11/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class LoginViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "ImageViewCell", bundle: nil), forCellReuseIdentifier: "customImageCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 140
        case 1:
            return 125
        case 2:
            return 65
        case 3:
            return 65
        default:
            return 80
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: "customImageCell", for: indexPath) as! CustomImageTableViewCell

        case 1:
            return tableView.dequeueReusableCell(withIdentifier: "inputs", for: indexPath)

        case 2:
            return tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath)

        case 3:
            return tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath)

        default:
            return UITableViewCell()
        }
    }
}
