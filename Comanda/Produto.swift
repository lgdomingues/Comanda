//
//  Produto.swift
//  Comanda
//
//  Created by Swift on 26/01/2018.
//  Copyright © 2018 Quaddro. All rights reserved.
//

import UIKit
import RealmSwift
import SwiftyJSON

class Produto: Object {
    
    @objc dynamic var nome: String? = nil
    @objc dynamic var descricao: String? = nil
    @objc dynamic var linkImagem: String? = nil
    @objc dynamic var identifier: String? = nil

    // Definir a chave primária da entidade
    override static func primaryKey() -> String {
        return "identifier"
    }
    
    static func createOrUpdate(json: JSON, realm: Realm) -> Produto? {
        // Verificar se o JSON é um objeto ou um ID String
        if let jsonID = json.string {
            // Verificar se existe um objeto com esse id no banco
            if let objetoLocal = realm.object(ofType: Produto.self, forPrimaryKey: jsonID) {
                return objetoLocal
            }
        } 
        
        // Garantir que possuímos o objeto com ID
        guard let identifier = json["_id"].string else { return nil }
        // Resgatar o objeto local do banco
        if let objetolocal = realm.object(ofType: Produto.self, forPrimaryKey: identifier) {
            // Atualizar os dados do objeto e retorná-lo
            objetolocal.update(json: json, realm: realm)
            return objetolocal
        } else {
            // Se o objeto não existir no DB local, criamos e atualizamos
            let objeto = Produto()
            // Definir a chave primária
            objeto.identifier = identifier
            // Atualizar os dados
            objeto.update(json: json, realm: realm)
            // Salvar no disco
            realm.add(objeto)
            return objeto
        }
    }
    
    func update(json: JSON, realm: Realm) {
        
    }
}
