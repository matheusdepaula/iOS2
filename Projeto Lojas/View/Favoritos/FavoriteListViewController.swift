//
//  MyListsViewController.swift
//  Aula 06
//
//  Created by Matheus de Paula on 21/08/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class FavoriteListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let buscaFavoritosController = BuscaFavoritosController()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buscaFavoritosController.quantidadeDeFavoritos()
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "FavoriteInformationTableViewCell")!
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let favoriteCell = cell as? FavoriteInformationTableViewCell {
            favoriteCell.nameLabel.text = buscaFavoritosController.nomeDoFavorito(indexPath.row)
            favoriteCell.storeLabel.text = "\(buscaFavoritosController.quantidadeDeLojas(indexPath.row))"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "listaVideoGame",
                          sender: buscaFavoritosController.nomeDoFavorito(indexPath.row))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "listaVideoGame" {
            if let vc = segue.destination as? FavoriteDetailTableViewController, let nomeDoFavorito = sender as? String {
                vc.nomeDoFavorito = nomeDoFavorito
            }
        }
    }

}
