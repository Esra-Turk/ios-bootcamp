//
//  YapilacakHucre.swift
//  to-do-app
//
//  Created by Esra Türk on 7.10.2024.
//

import UIKit

class YapilacakHucre: UITableViewCell {
    
    @IBOutlet weak var yapilacakLabel: UILabel!
    @IBOutlet weak var buttonTamamla: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonTamamla(_ sender: Any) {
    }
    
}
