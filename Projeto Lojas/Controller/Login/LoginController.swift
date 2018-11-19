//
//  LoginController.swift
//  Projeto Lojas
//
//  Created by Ítalo Ferreira on 15/11/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class LoginController {

    var realm: Realm?
    
    init() {
        do {
            try self.realm = Realm()
        } catch let error {
            print("Não foi possivel instanciar o Realm. Erro: \(error.localizedDescription))")
        }
    }
    
    func efetuarLogin(email: String, senha: String) -> Bool? {
        let predicate = NSPredicate(format: "email = %@ AND senha = %@", email, senha)
        if let result = realm?.objects(Usuario.self).filter(predicate), let _ = result.first {
            UserDefaults.standard.set(email, forKey: "email")
            return true
        }
        return false
    }
    
    func efetuarLogout() {
        UserDefaults.standard.removeObject(forKey: "email")
    }
}
