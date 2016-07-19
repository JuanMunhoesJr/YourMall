//
//  CellOfertas.swift
//  YourMall
//
//  Created by Student on 7/19/16.
//  Copyright © 2016 Hackatruck. All rights reserved.
//

import UIKit

class CellOfertas: UITableViewCell {

    @IBOutlet weak var imgPerfil:UIImageView!
    @IBOutlet weak var lblNomeLoja:UILabel!
    @IBOutlet weak var lblCategoria:UILabel!
    @IBOutlet weak var lblDescricao:UILabel!
    @IBOutlet weak var lblValor:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
