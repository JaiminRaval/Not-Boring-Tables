//
//  MyDataCell.swift
//  Not-Boring-Tables
//
//  Created by Jaimin Raval on 04/09/25.
//

import UIKit

class MyDataCell: UITableViewCell {

    @IBOutlet weak var idTxt: UILabel!
    @IBOutlet weak var typeTxt: UILabel!
    @IBOutlet weak var setupTxt: UILabel!
    @IBOutlet weak var punchlineTxt: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
