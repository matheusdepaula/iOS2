//
//  BuscaLojasController.swift
//  Projeto Lojas
//
//  Created by Renê Xavier on 20/09/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import Realm
import RealmSwift

class BuscaLojasController {
    var todasAsLojas: [Loja] = []
    var realm: Realm?
    
    init() {
        do {
            try self.realm = Realm()
            let lojas = Array(realm!.objects(Loja.self))
            todasAsLojas.append(contentsOf: lojas)
        } catch let error {
            print("Não foi possivel instanciar o Realm. Erro: \(error.localizedDescription))")
        }
    }
    
    func quantidadeDeLojas() -> Int {
        return todasAsLojas.count
    }
    
    func nomeDaLoja(_ index: Int) -> String {
        return todasAsLojas[index].nome
    }

    func nomeLogoLoja(_ index: Int) -> String {
        return todasAsLojas[index].iconeGrande
    }
    
    func lojaVendeComputador(_ index: Int) -> Bool {
        return todasAsLojas[index].vendeComputador
    }
    
    func lojaVendeJogos(_ index: Int) -> Bool {
        return todasAsLojas[index].vendeJogos
    }
}
