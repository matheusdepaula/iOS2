//
//  GameListViewController.swift
//  Aula 06
//
//  Created by Matheus de Paula on 30/08/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class GameListViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK: TableView Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 60
        default:
            return 130
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: "gamesListCell") ?? UITableViewCell()
        default:
            return tableView.dequeueReusableCell(withIdentifier: "storeCell") ?? UITableViewCell()
        }
    }
    
    //MARK: TableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "myLists")
        
        self.present(viewController, animated: true, completion: nil);
    }
}
