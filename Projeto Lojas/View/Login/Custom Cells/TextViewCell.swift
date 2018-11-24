//
//  TextViewCell.swift
//  Projeto Lojas
//
//  Created by Matheus de Paula on 24/11/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class TextViewCell: UITableViewCell {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var separator: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
