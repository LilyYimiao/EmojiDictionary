//
//  EmojiTableViewCell.swift
//  EmojiDictionary
//
//  Created by Soft Dev on 5/28/19.
//  Copyright © 2019 Lily Guo. All rights reserved.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
    
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    func update(with emoji: Emoji) {
        symbolLabel.text = emoji.symbol
        nameLabel.text = emoji.name
        descriptionLabel.text = emoji.description
    }
}
