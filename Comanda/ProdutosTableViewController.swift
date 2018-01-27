//
//  ProdutosTableViewController.swift
//  Comanda
//
//  Created by Swift on 26/01/2018.
//  Copyright © 2018 Quaddro. All rights reserved.
//

import UIKit
import SwiftKeychainWrapper

class ProdutosTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func sair(_ sender: UIBarButtonItem) {
        // Remover o token de acesso
        KeychainWrapper.standard.removeObject(forKey: keyJWT)
        
        // Exibir a tela de login
        self.performSegue(withIdentifier: "logoutSegue", sender: sender)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

}
