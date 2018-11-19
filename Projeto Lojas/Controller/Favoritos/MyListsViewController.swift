//
//  MyListsViewController.swift
//  Aula 06
//
//  Created by Matheus de Paula on 21/08/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class MyListsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

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
        //TODO: Usar o buscaFavoritosController para popular as celulas
        return tableView.dequeueReusableCell(withIdentifier: "simple_cell")!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "listaVideoGame", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier, identifier == "listaVideoGame" {
            if let vc = segue.destination as? GameListViewController {
                vc.nomeDoFavorito = "Lista Jogos" //TODO: Usar o nome da lista selecionada
            }
        }
    }

}
