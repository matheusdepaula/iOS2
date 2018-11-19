//
//  StoreDetailsViewController.swift
//  Projeto Lojas
//
//  Created by Matheus de Paula on 17/11/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class StoreDetailsViewController: UITableViewController {

    var detalheLojaController: DetalheLojaController!
    var nomeDaLoja: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detalheLojaController = DetalheLojaController(nomeDaLoja: nomeDaLoja)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //TODO: Utilizar a detalheLojaController para definir a quantidade de células
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 190
            
        case 1:
            return 75
            
        case 2:
            return 55
        default:
            return 60
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //TODO: Utilizar a detalheLojaController para popular as células
        switch indexPath.row {
        case 0:
            
            return tableView.dequeueReusableCell(withIdentifier: "storeDetail") ?? UITableViewCell()
        case 1:
            
            return tableView.dequeueReusableCell(withIdentifier: "mapDetail") ?? UITableViewCell()

        case 2:
    
            return tableView.dequeueReusableCell(withIdentifier: "titleDetail") ?? UITableViewCell()
            
        default:
           return tableView.dequeueReusableCell(withIdentifier: "cellInfoDetail") ?? UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
