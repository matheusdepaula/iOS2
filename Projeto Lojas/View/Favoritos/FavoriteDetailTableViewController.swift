//
//  GameListViewController.swift
//  Aula 06
//
//  Created by Matheus de Paula on 30/08/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class FavoriteDetailTableViewController: UITableViewController {
    
    var detalheFavoritoController: DetalheFavoritoController!
    var nomeDoFavorito: String!
    @IBOutlet weak var loucamente: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detalheFavoritoController = DetalheFavoritoController(nomeDoFavorito: nomeDoFavorito)
    }
    
    //MARK: TableView Data Source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detalheFavoritoController.quantidadeDeLojas() + 1
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
            return tableView.dequeueReusableCell(withIdentifier: "FavoriteHeaderTableViewCell") ?? UITableViewCell()
        default:
            return tableView.dequeueReusableCell(withIdentifier: "FavoriteDetailTableViewCell") ?? UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            (cell as? FavoriteHeaderTableViewCell)?.titleLabel.text = nomeDoFavorito
        default:
            if let detailCell  = cell as? FavoriteDetailTableViewCell {
                let storeIndex = indexPath.row - 1
                detailCell.logoImageView.image = UIImage(named: detalheFavoritoController.logoDaLoja(storeIndex))
                detailCell.nameLabel.text = detalheFavoritoController.nomeDaLoja(storeIndex)
                detailCell.gamesImageView.image = detalheFavoritoController.lojaVendeJogos(storeIndex) ? UIImage(named: "video-game") : nil
                detailCell.computerImageView.image = detalheFavoritoController.lojaVendeComputador(storeIndex) ? UIImage(named: "pc") : nil
            }
        }
    }
    
    //MARK: TableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "myLists")
        
        self.present(viewController, animated: true, completion: nil);
    }
}
