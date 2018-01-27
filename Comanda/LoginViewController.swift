//
//  LoginViewController.swift
//  Comanda
//
//  Created by Swift on 26/01/2018.
//  Copyright © 2018 Quaddro. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftKeychainWrapper

class LoginViewController: UIViewController {

    @IBOutlet weak var comandaTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

     @IBAction func entrar(_ sender: UIButton) {
        // Garantir que possuímos o código da comanda
        guard let comanda = self.comandaTextField.text else { return }
        
        // Efetuar o post da autenticação
        let parametros = ["comanda": comanda]
        Alamofire.request(WEBSERVICE_URL + "/auth/comanda", method: .post, parameters: parametros, encoding: JSONEncoding.default).validate().responseJSON { (resultado) in
            // Verificar o status da reposta
            switch resultado.result {
            case .success(let dadosJSON):
                // Criar o objeto do JSON
                let json = JSON(dadosJSON)
                let token = json["token"].stringValue
                
                // Salvar o token no keychain
                KeychainWrapper.standard.set(token, forKey: keyJWT)
                
                // Entrar no app
                self.performSegue(withIdentifier: "loginSegue", sender: sender)
                
            case .failure(let error):
                print("Erro na resposta do post: \(error)")
            }
        }
    }
    
}
