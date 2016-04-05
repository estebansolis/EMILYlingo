//
//  PhraseTableViewCell.swift
//  EMILYlingo
//
//  Created by ali.anish91 on 4/4/16.
//  Copyright © 2016 EMILYlingo. All rights reserved.
//

import UIKit

class PhraseTableViewCell: UITableViewCell {

    @IBOutlet weak var phraseNameLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var genderImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
