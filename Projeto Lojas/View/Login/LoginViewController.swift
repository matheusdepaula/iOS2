//
//  LoginViewController.swift
//  Projeto Lojas
//
//  Created by Matheus de Paula on 21/11/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class LoginViewController: UITableViewController, ActionTableViewCellProtocol {
    
    let loginController = LoginController()
    var inputCell: TextTableViewCell?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibFiles()
    }
    
    func registerNibFiles() {
        
        tableView.register(UINib(nibName: "ImageViewCell", bundle: nil), forCellReuseIdentifier: "customImageCell")
        tableView.register(UINib(nibName: "ActionViewCell", bundle: nil), forCellReuseIdentifier: "buttonCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.row {
        case 0:
            return 140
        case 1:
            return 125
        case 2:
            return 65
        case 3:
            return 65
        default:
            return 80
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            return tableView.dequeueReusableCell(withIdentifier: "customImageCell", for: indexPath) as! CustomImageTableViewCell

        case 1:
            inputCell = tableView.dequeueReusableCell(withIdentifier: "inputs", for: indexPath) as? TextTableViewCell
            return inputCell!

        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as! ActionTableViewCell
            cell.actionButton.tag = 0
            
            cell.delegate = self

            return cell

        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "buttonCell", for: indexPath) as! ActionTableViewCell
            cell.actionButton.tag = 1
            cell.actionButton.setTitle("Cadastre-se", for: .normal)
            cell.actionButton.backgroundColor = .red
            
            cell.delegate = self
            
            return cell

        default:
            return UITableViewCell()
        }
    }
    
    //MARK: Action cell delegate
    func didTouchButton(_ button: UIButton) {
        if button.tag == 0 {
            if let cell = inputCell {
                if ((cell.email.text == "") || (cell.password.text == "")) {
                    
                    let alert = UIAlertController(title: nil, message: "Para entrar digite seu E-mail e Senha!", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    
                } else {
                    
                    if (loginController.efetuarLogin(email: cell.email.text!, senha: cell.password.text!) ?? false) {
                        let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let controller = storyboard.instantiateViewController(withIdentifier: "profileScene")
                        self.present(controller, animated: true, completion: nil)
                    } else {
                        
                        let alert = UIAlertController(title: "Error", message: "Usuário ou senha não reconhecido", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)

                    }
                }
            }
        } else {

            self.performSegue(withIdentifier: "signup", sender: nil)
        }
    }
}
