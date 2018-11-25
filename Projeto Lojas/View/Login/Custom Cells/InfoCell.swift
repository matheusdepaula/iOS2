//
//  InfoCell.swift
//  Projeto Lojas
//
//  Created by Matheus de Paula on 25/11/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class InfoCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var phone: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
