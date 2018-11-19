//
//  DetalheFavoritoController.swift
//  Projeto Favoritos
//
//  Created by Ítalo Ferreira on 16/11/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class DetalheFavoritoController {
    
    var realm: Realm?
    private var favorito: Favorito?
    
    init(nomeDoFavorito: String) {
        do {
            try self.realm = Realm()
            self.favorito = realm?.object(ofType: Favorito.self, forPrimaryKey: nomeDoFavorito)
        } catch let error {
            print("Não foi possivel instanciar o Realm. Erro: \(error.localizedDescription))")
        }
    }
    
    func nomeDoFavorito() -> String {
        return favorito?.nome ?? ""
    }
    
    func quantidadeDeLojas() -> Int {
        return favorito?.lojas.count ?? 0
    }
    
    func logoDaLoja(_ index: Int) -> String {
        return favorito?.lojas[index].iconeGrande ?? ""
    }
    
    func lojaVendeComputador(_ index: Int) -> Bool {
        return favorito?.lojas[index].vendeComputador ?? false
    }
    
    func lojaVendeJogos(_ index: Int) -> Bool {
        return favorito?.lojas[index].vendeJogos ?? false
    }
}
