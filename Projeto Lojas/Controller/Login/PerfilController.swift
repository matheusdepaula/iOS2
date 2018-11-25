//
//  PerfilController.swift
//  Projeto Lojas
//
//  Created by Ítalo Ferreira on 16/11/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class PerfilController {

    var realm: Realm?
    
    private var usuario: Usuario? {
        guard let email = UserDefaults.standard.string(forKey: "email") else { return nil }
        return realm?.object(ofType: Usuario.self, forPrimaryKey: email)
    }
    
    init() {
        do {
            try self.realm = Realm()
        } catch let error {
            print("Não foi possivel instanciar o Realm. Erro: \(error.localizedDescription))")
        }
    }

    func nomeDoUsuario() -> String {
        return usuario?.nome ?? ""
    }
    
    func imagemDoUsuario() -> String {
        return usuario?.foto ?? "user-logo"
    }
    
    func emailDoUsuario() -> String {
        return usuario?.email ?? ""
    }
    
    func telefoneDoUsuario() -> String {
        return usuario?.telefone ?? ""
    }
    
    func quantidadeDeListas() -> Int {
        return usuario?.listasFavoritos.count ?? 0
    }
}
