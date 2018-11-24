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
    
    var name: UITextField?
    var email: UITextField?
    var password: UITextField?
    var phone: UITextField?
    var age: UITextField?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TextViewCell", bundle: nil), forCellReuseIdentifier: "textRow")

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
            let cell = tableView.dequeueReusableCell(withIdentifier: "textRow", for: indexPath) as! TextViewCell
            cell.textField.placeholder = "Nome"
            name = cell.textField

            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "textRow", for: indexPath) as! TextViewCell
            cell.textField.placeholder = "E-mail"
            cell.textField.keyboardType = UIKeyboardType.emailAddress
            
            email = cell.textField

            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "textRow", for: indexPath) as! TextViewCell
            cell.textField.placeholder = "Senha"
            cell.textField.isSecureTextEntry = true
            
            password = cell.textField

            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "textRow", for: indexPath) as! TextViewCell
            cell.textField.placeholder = "Telefone"
            cell.textField.keyboardType = UIKeyboardType.phonePad
            
            phone = cell.textField

            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "textRow", for: indexPath) as! TextViewCell
            cell.textField.placeholder = "Idade"
            cell.textField.keyboardType = UIKeyboardType.numberPad

            age = cell.textField

            return cell
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
        let profileVC = storyboard.instantiateViewController(withIdentifier: "profileScene")
        
        let registerStatus = cadastraUsuarioController.cadastrar(nome: name?.text ?? "", email: email?.text ?? "", senha: password?.text ?? "", telefone: phone?.text ?? "", idade: Int(age?.text ?? "0")!)
        
        if registerStatus {
            self.present(profileVC, animated: true, completion: nil)
        } else {
            
            let alert = UIAlertController(title: "Erro", message: "Erro ao cadastar as informações do usuário. Tente novamente mais tarde.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
    }
}
