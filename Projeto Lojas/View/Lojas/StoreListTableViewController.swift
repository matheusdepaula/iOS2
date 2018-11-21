//
//  StoresTableViewController.swift
//  Aula 06
//
//  Created by Matheus de Paula on 27/08/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class StoreListTableViewController: UITableViewController {

    let controller = BuscaLojasController()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.quantidadeDeLojas()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoreDetailTableViewCell", for: indexPath)
        if let storeCell = cell as? StoreDetailTableViewCell {
            storeCell.nameLabel.text = controller.nomeDaLoja(indexPath.row)
            storeCell.logoImageView.image = UIImage(named: controller.nomeLogoLoja(indexPath.row))
            storeCell.gamesImageView.image = controller.lojaVendeJogos(indexPath.row) ? UIImage(named: "video-game") : nil
            storeCell.computerImageView.image = controller.lojaVendeComputador(indexPath.row) ? UIImage(named: "pc") : nil
            
            return storeCell
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "storeDetail", sender: nil)
    }

}
