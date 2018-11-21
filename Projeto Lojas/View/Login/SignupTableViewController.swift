//
//  SignupTableViewController.swift
//  Aula 06
//
//  Created by Matheus de Paula on 27/08/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class SignupTableViewController: UITableViewController {

    let cadastraUsuarioController = CadastraUsuarioController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableCell(withIdentifier: "header")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: "nameRow")!
        case 1:
            return tableView.dequeueReusableCell(withIdentifier: "emailRow")!
        case 2:
            return tableView.dequeueReusableCell(withIdentifier: "passRow")!
        case 3:
            return tableView.dequeueReusableCell(withIdentifier: "phoneRow")!
        case 4:
            return tableView.dequeueReusableCell(withIdentifier: "ageRow")!
        case 5:
            return tableView.dequeueReusableCell(withIdentifier: "emptyRow")!
        case 6:
            return tableView.dequeueReusableCell(withIdentifier: "actionRow")!
        default:
            return tableView.dequeueReusableCell(withIdentifier: "emptyRow")!
        }
    }
    
    
    @IBAction func closeAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signupAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let profileVC = storyboard.instantiateViewController(withIdentifier: "userDetail")
        //TODO: Utilizar o cadastraUsuarioController passando as informações necessarias para o cadastro do usuario
        self.present(profileVC, animated: true, completion: nil)
    }
}
