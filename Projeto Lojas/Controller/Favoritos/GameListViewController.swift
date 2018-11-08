//
//  GameListViewController.swift
//  Aula 06
//
//  Created by Matheus de Paula on 30/08/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class GameListViewController: UIViewController {

    @IBOutlet weak var firstItem: UIView!
    @IBOutlet weak var secondItem: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addGestures()
    }
    
    func addGestures() {
        firstItem.addGestureRecognizer(getTap())
        secondItem.addGestureRecognizer(getTap())
    }
    
    func getTap() -> UITapGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        tap.numberOfTapsRequired = 1

        return tap;
    }
    
    @objc func handleTap() {
        //Do something
    }

    @IBAction func addItem(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "myLists")
        
        self.present(viewController, animated: true, completion: nil);

    }
}
