//
//  CustomImageTableViewCell.swift
//  Projeto Lojas
//
//  Created by Matheus de Paula on 21/11/18.
//  Copyright © 2018 com.iesb. All rights reserved.
//

import UIKit

class CustomImageTableViewCell: UITableViewCell {

    @IBOutlet weak var customImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
