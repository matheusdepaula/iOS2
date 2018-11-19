//
//  Database.swift
//  Projeto Lojas
//
//  Created by Renê Xavier on 03/10/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import Foundation
import RealmSwift

class Database {
    
    static func preencheDadosIniciais() {
        
        if let pathComponent = Realm.Configuration.defaultConfiguration.fileURL {
            if FileManager.default.fileExists(atPath: pathComponent.path) {
                print("Realm já existe")
            } else {
                print("Realm não foi criado, vamos copiar...")
                if let caminhoRealmPreenchido = Bundle.main.url(forResource: "lojas", withExtension: "realm") {
                    do {
                        try FileManager.default.copyItem(at: caminhoRealmPreenchido, to: pathComponent)
                        print("Realm preenchido com sucesso")
                    } catch let error {
                        print(error)
                        print("Erro ao copiar o Realm já preenchido")
                    }
                } else {
                    print("Realm não foi encontrado")
                }
            }
        } else {
            print("Erro ao preencher dados iniciais")
        }
        
        mockAll()
        
    }
    
    
    static func mockAll() {
        let produtos = mockProdutos()
        let lojas = mockLojas(produtos: produtos)
        let _ = mockFavoritos(lojas: lojas)
    }
    
    static func mockProdutos() -> [Produto] {
        let productsMock = [
            Produto(titulo: "Tênis Corrida", imagem: "exit", descricao: "Tênis para corrida"),
            Produto(titulo: "Camisa de time", imagem: "exit", descricao: "Uniforme de todos os times"),
            Produto(titulo: "Tênis", imagem: "exit", descricao: "Tênis masculino"),
            Produto(titulo: "Salto alto", imagem: "exit", descricao: "Salto tamanho 34"),
            Produto(titulo: "Earpods", imagem: "iphonex", descricao: "Fone bluetooth da Apple"),
            Produto(titulo: "Mario Kart", imagem: "exit", descricao: "Jogo para Nintendo 64"),
            Produto(titulo: "Pixel 2", imagem: "android", descricao: "Troca de tela"),
            Produto(titulo: "iPhone X", imagem: "iphonex", descricao: "Troca de tela"),
            Produto(titulo: "MacBook Pro", imagem: "exit", descricao: "Computador da Apple"),
            Produto(titulo: "Street Fighter", imagem: "exit", descricao: "Jogo para Playstation 4"),
            Produto(titulo: "Conserto Android", imagem: "android", descricao: "Troca de tela"),
            Produto(titulo: "Conserto iPhone", imagem: "iphonex", descricao: "Troca de tela")
        ]
        
        do {
            let realm = try Realm()
            if realm.objects(Produto.self).count == 0 {
                try realm.write {
                    realm.add(productsMock)
                }
            }
        } catch { }
        
        return productsMock
    }
    
    static func mockLojas(produtos: [Produto]) -> [Loja] {
        let produtosCentauro = List<Produto>([produtos[0], produtos[1]])
        let produtosLuarte = List<Produto>([produtos[2], produtos[3]])
        let produtosCasasBahia = List<Produto>([produtos[4]])
        let produtosJuninho = List<Produto>([produtos[5], produtos[6], produtos[7]])
        let produtosRicardo = List<Produto>([produtos[8], produtos[9], produtos[10], produtos[11]])
        
        let lojasMock = [Loja(nome: "Centauro", iconePequeno: "exit", iconeGrande: "exit", favorita: false, vendeComputador: false, vendeJogos: false, produtos:produtosCentauro),
                         Loja(nome: "Luarte Calçados", iconePequeno: "exit", iconeGrande: "exit", favorita: false, vendeComputador: false, vendeJogos: false, produtos: produtosLuarte),
                         Loja(nome: "Casas Bahia", iconePequeno: "header-bahianinho", iconeGrande: "Casas_Bahia_logo", favorita: true, vendeComputador: true, vendeJogos: false, produtos: produtosCasasBahia),
                         Loja(nome: "Juninho Systems", iconePequeno: "header-bahianinho", iconeGrande: "Casas_Bahia_logo", favorita: true, vendeComputador: false, vendeJogos: true, produtos: produtosJuninho),
                         Loja(nome: "Ricardo Eletro", iconePequeno: "header-ricardo", iconeGrande: "logo_ricardo_eletro", favorita: true, vendeComputador: true, vendeJogos: true, produtos: produtosRicardo)]
        
        do {
            let realm = try Realm()
            if realm.objects(Loja.self).count == 0 {
                try realm.write {
                    realm.add(lojasMock)
                }
            }
        } catch { }
        
        return lojasMock
    }
    
    static func mockFavoritos(lojas: [Loja]) -> [Favorito] {
        
        let lojasDeJogos = List<Loja>([lojas[4], lojas[3]])
        let lojasDeFones = List<Loja>([lojas[2]])
        let favoritosMock = [
            Favorito(nome: "Lojas de jogos", lojas: lojasDeJogos),
            Favorito(nome: "Fones", lojas: lojasDeFones)
        ]
        
        do {
            let realm = try Realm()
            if realm.objects(Favorito.self).count == 0 {
                try realm.write {
                    realm.add(favoritosMock)
                }
            }
        } catch { }
        
        return favoritosMock
    }
}
