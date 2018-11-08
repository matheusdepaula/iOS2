//
//  StoresTableViewController.swift
//  Aula 06
//
//  Created by Matheus de Paula on 27/08/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class StoresTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: "casasBahiaCell")!
        case 1:
            return tableView.dequeueReusableCell(withIdentifier: "casasBahiaCell")!
        case 2:
            return tableView.dequeueReusableCell(withIdentifier: "RicardoCell")!

        default:
            return tableView.dequeueReusableCell(withIdentifier: "casasBahiaCell")!
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "storeDetail", sender: nil)
    }

}
