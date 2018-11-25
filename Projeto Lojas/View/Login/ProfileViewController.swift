//
//  ProfileViewController.swift
//  Aula 06
//
//  Created by Matheus de Paula on 30/08/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class ProfileViewController: UITableViewController {
    
    let perfilController = PerfilController()
    let loginController = LoginController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibFiles()
    }
    
    func registerNibFiles() {
        tableView.register(UINib(nibName: "InfoCell", bundle: nil), forCellReuseIdentifier: "info")
        
        tableView.register(UINib(nibName: "ImageViewCell", bundle: nil), forCellReuseIdentifier: "customImageCell")

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 178
        case 1:
            return 150
        case 2:
            return 130
        case 3:
            return 78
        default:
            return 100
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "customImageCell", for: indexPath) as! CustomImageTableViewCell
            
            cell.customImage.image = UIImage.init(named: perfilController.imagemDoUsuario())
            
            return cell

        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "info") as! InfoCell
            
            cell.name.text = perfilController.nomeDoUsuario()
            cell.email.text = perfilController.emailDoUsuario()
            cell.phone.text = perfilController.telefoneDoUsuario()
            
            return cell
        case 2:
            return tableView.dequeueReusableCell(withIdentifier: "otherCell") ?? UITableViewCell()
        case 3:
            return tableView.dequeueReusableCell(withIdentifier: "buttonCell") ?? UITableViewCell()
        default:
            return UITableViewCell()
        }
    }
    
    @IBAction func didBack(_ sender: Any) {
        
        loginController.efetuarLogout()
        
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    

}
