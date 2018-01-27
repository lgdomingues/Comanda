//
//  ComandaTableViewController.swift
//  Comanda
//
//  Created by Swift on 26/01/2018.
//  Copyright © 2018 Quaddro. All rights reserved.
//

import UIKit

class ComandaTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func limpar(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func finalizar(_ sender: UIBarButtonItem) {
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
