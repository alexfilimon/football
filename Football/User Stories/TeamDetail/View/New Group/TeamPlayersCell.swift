//
//  TeamPlayersCell.swift
//  Football
//
//  Created by Alexander Filimonov on 23/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import UIKit
import Eureka

class TeamPlayersCell: Cell<Int>, CellType {

    // MARK: - Subviews

    @IBOutlet private weak var leftLabel: UILabel!
    @IBOutlet private weak var rightLabel: UILabel!
    
    // MARK: - Cell

    override func setup() {
        super.setup()

        leftLabel.text = "Игроков"
        rightLabel.text = String(row.value ?? 0)

        leftLabel.numberOfLines = 0
        rightLabel.numberOfLines = 0

        leftLabel.textColor = .black
        rightLabel.textColor = .black
    }

    override func update() {
        rightLabel.text = String(row.value ?? 0)
    }
    
}

final class TeamPlayerRow: Row<TeamPlayersCell>, RowType {
    required init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<TeamPlayersCell>(nibName: "TeamPlayersCell")
    }
}
