//
//  LojasServidor.swift
//  Projeto Lojas
//
//  Created by Ítalo Ferreira on 16/11/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class LojasServidor: Object {
    var listaLojas = List<Loja>()
    
}
