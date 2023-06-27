//
//  DefaultTableViewCell.swift
//  Swift_Laboratory
//
//  Created by 中久木 雅哉(Nakakuki Masaya) on 2023/06/27.
//  Copyright (c) 2023 ReNKCHANNEL. All rihgts reserved.
//

import UIKit

class DefaultTableViewCell: UITableViewCell {

    @IBOutlet private weak var itemLabel: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        itemLabel.text = nil
    }
    
    func configure(_ name: String) {
        itemLabel.text = name
    }
    
}
