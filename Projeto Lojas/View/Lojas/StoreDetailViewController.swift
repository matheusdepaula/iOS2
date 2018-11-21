//
//  StoreDetailsViewController.swift
//  Projeto Lojas
//
//  Created by Matheus de Paula on 17/11/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class StoreDetailViewController: UITableViewController {

    var detalheLojaController: DetalheLojaController!
    var nomeDaLoja: String = ""
    
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detalheLojaController = DetalheLojaController(nomeDaLoja: nomeDaLoja)
        nameLabel.text = nomeDaLoja
        logoImageView.image = UIImage(named: detalheLojaController.logoDaLoja())
        favoriteImageView.image = detalheLojaController.lojaFavorita() ? UIImage(named: "liked") : UIImage(named: "like")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detalheLojaController.quantidadeDeProdutos()
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell") ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let productCell = cell as? ProductTableViewCell {
            productCell.productImageView.image = UIImage(named: detalheLojaController.imagemDoProduto(indexPath.row))
            productCell.titleLabel.text = detalheLojaController.nomeDoProduto(indexPath.row)
            productCell.descriptionLabel.text = detalheLojaController.descricaoDoProduto(indexPath.row)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
