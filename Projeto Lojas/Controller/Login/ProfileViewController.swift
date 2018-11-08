//
//  ProfileViewController.swift
//  Aula 06
//
//  Created by Matheus de Paula on 30/08/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func didBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    

}
