//
//  TeamPlayersCell.swift
//  Football
//
//  Created by Alexander Filimonov on 23/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import UIKit
import Eureka

class TeamPlayersCell: Cell<String>, CellType {

    // MARK: - Subviews

    @IBOutlet private weak var leftLabel: UILabel!
    @IBOutlet private weak var rightLabel: UILabel!

    // MARK: - Cell

    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)

        backgroundColor = highlighted ? Color.delimeter : Color.white
    }

    override func setup() {
        super.setup()

        leftLabel.text = row.title
        rightLabel.text = row.value

        leftLabel.numberOfLines = 0
        rightLabel.numberOfLines = 0

        leftLabel.textColor = .black
        rightLabel.textColor = .black

        selectionStyle = .none
    }

    override func update() {
        rightLabel.text = row.value
    }

}

final class TeamPlayerRow: Row<TeamPlayersCell>, RowType {
    required init(tag: String?) {
        super.init(tag: tag)
        cellProvider = CellProvider<TeamPlayersCell>(nibName: "TeamPlayersCell")
    }
}
