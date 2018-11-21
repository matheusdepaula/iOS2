//
//  BuscaFavoritosController.swift
//  Projeto Lojas
//
//  Created by Ítalo Ferreira on 16/11/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class BuscaFavoritosController {
    var realm: Realm?
    
    init() {
        do {
            try self.realm = Realm()
        } catch let error {
            print("Não foi possivel instanciar o Realm. Erro: \(error.localizedDescription))")
        }
    }
    
    func quantidadeDeFavoritos() -> Int {
        return realm?.objects(Favorito.self).count ?? 0
    }
    
    func nomeDoFavorito(_ index: Int) -> String {
        return realm?.objects(Favorito.self)[index].nome ?? ""
    }
    
    func quantidadeDeLojas(_ index: Int) -> Int {
        return realm?.objects(Favorito.self)[index].lojas.count ?? 0
    }
    
}
