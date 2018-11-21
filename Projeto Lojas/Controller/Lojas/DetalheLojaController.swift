//
//  DetalheLojaController.swift
//  Projeto Lojas
//
//  Created by Ítalo Ferreira on 16/11/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class DetalheLojaController {
    
    var realm: Realm?
    private var loja: Loja?
    
    init(nomeDaLoja: String) {
        do {
            try self.realm = Realm()
            self.loja = realm?.object(ofType: Loja.self, forPrimaryKey: nomeDaLoja)
        } catch let error {
            print("Não foi possivel instanciar o Realm. Erro: \(error.localizedDescription))")
        }
    }
    
    
    func nomeDaLoja() -> String {
        return loja?.nome ?? ""
    }
    
    func logoDaLoja() -> String {
        return loja?.iconeGrande ?? ""
    }
    
    func quantidadeDeProdutos() -> Int {
        return loja?.produtos.count ?? 0
    }
    
    func lojaFavorita() -> Bool {
        return loja?.favorita ?? false
    }
    
    func nomeDoProduto(_ index: Int) -> String {
        return loja?.produtos[index].titulo ?? ""
    }
    
    func imagemDoProduto(_ index: Int) -> String {
        return loja?.produtos[index].imagem ?? ""
    }

    func descricaoDoProduto(_ index: Int) -> String {
        return loja?.produtos[index].descricao ?? ""
    }
}
