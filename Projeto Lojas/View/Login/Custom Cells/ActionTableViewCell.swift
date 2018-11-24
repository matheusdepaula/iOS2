//
//  ActionTableViewCell.swift
//  Projeto Lojas
//
//  Created by Matheus de Paula on 24/11/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

protocol ActionTableViewCellProtocol: class {
    func didTouchButton(_ button: UIButton);
}

class ActionTableViewCell: UITableViewCell {

    @IBOutlet weak var actionButton: UIButton!
    weak var  delegate: ActionTableViewCellProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func didTouchButton(_ sender: Any) {
        delegate?.didTouchButton(actionButton)
    }
    

}
