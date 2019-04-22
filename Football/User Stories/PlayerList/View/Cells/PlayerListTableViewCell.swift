//
//  PlayerListTableViewCell.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import UIKit
import ReactiveDataDisplayManager

class PlayerListTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension PlayerListTableViewCell: Configurable {
    typealias Model = Player

    func configure(with model: Player) {
        textLabel?.text = "\(String(model.id?.uuidString.prefix(5) ?? "")): \(model.name ?? "")"
    }
}
