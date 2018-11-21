//
//  FavoriteInformationTableViewCell.swift
//  Projeto Lojas
//
//  Created by Ítalo Ferreira on 20/11/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class FavoriteInformationTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
