//
//  CadastroController.swift
//  Projeto Lojas
//
//  Created by Ítalo Ferreira on 15/11/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import Foundation

import Realm
import RealmSwift

class CadastraUsuarioController {
    var realm: Realm?
    
    init() {
        do {
            try self.realm = Realm()
        } catch let error {
            print("Não foi possivel instanciar o Realm. Erro: \(error.localizedDescription))")
        }
    }
    
    func cadastrar(nome: String, email: String, senha: String, telefone: String, idade: Int) -> Bool {
        guard let realm = self.realm else { return false }
        let novoUsuario = Usuario(nome: nome, foto: "user-logo", email: email, senha: senha, telefone: telefone, idade: idade)
        do {
            try realm.write {
                realm.add(novoUsuario)
            }
            UserDefaults.standard.set(email, forKey: "email")
            return true
        } catch let error {
            print("Não foi possivel criar um novo Usuario. Erro: \(error.localizedDescription))")
            return false
        }
    }
}
