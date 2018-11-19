//
//  Loja.swift
//  Projeto Lojas
//
//  Created by Renê Xavier on 27/09/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import Realm
import RealmSwift

class Loja: Object {
    @objc dynamic var nome: String = ""
    @objc dynamic var iconePequeno: String = ""
    @objc dynamic var iconeGrande: String = ""
    @objc dynamic var favorita: Bool = false
    @objc dynamic var vendeComputador: Bool = false
    @objc dynamic var vendeJogos: Bool = false
    var produtos = List<Produto>()

    override static func primaryKey() -> String? {
        return "nome"
    }
    
    convenience init(nome: String, iconePequeno: String, iconeGrande: String, favorita: Bool, vendeComputador: Bool, vendeJogos: Bool, produtos: List<Produto> = List<Produto>()) {
        self.init()
        self.nome = nome
        self.iconePequeno = iconePequeno
        self.iconeGrande = iconeGrande
        self.favorita = favorita
        self.vendeComputador = vendeComputador
        self.vendeJogos = vendeJogos
        self.produtos = produtos
    }
    
    convenience init(_ nome: String, _ logo: String) {
        self.init()
        self.nome = nome
    }
    
}
