//
//  MainTableViewCell.swift
//  newsapp
//
//  Created by Emre Taner  Çetinkaya on 16.08.2022.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    
    // MARKS
  
    @IBOutlet weak var currencyCode: UILabel!
    @IBOutlet weak var currencyBuying: UILabel!
    @IBOutlet weak var currencyRate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
