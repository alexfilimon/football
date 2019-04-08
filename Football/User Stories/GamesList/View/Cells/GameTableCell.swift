//
//  GameTableCell.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import UIKit
import ReactiveDataDisplayManager

class GameTableCell: UITableViewCell {

    // MARK: - IBOutlets

    @IBOutlet private weak var hostTeamLabel: UILabel!
    @IBOutlet private weak var visitorTeamLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()

        configureAppearance()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Private configurators

    private func configureAppearance() {

    }

}

extension GameTableCell: Configurable {

    typealias Model = GameRealmEntry

    func configure(with model: GameRealmEntry) {
        hostTeamLabel.text = model.hostTeam?.name
        visitorTeamLabel.text = model.visitorTeam?.name
        scoreLabel.text = "\(Score(model.score).hostScore) : \(Score(model.score).visitorScore)"
    }

}
