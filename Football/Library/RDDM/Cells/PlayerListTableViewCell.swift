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

    // MARK: - Subviews

    @IBOutlet private weak var leftLabel: UILabel!
    @IBOutlet private weak var rightLabel: UILabel!

    // MARK: - UITableViewCell

    override func awakeFromNib() {
        super.awakeFromNib()

        configureAppearance()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Public methods

    public func configure(with title: String, description: String) {
        leftLabel.text = title
        rightLabel.text = description
    }

    // MARK: - Private methods

    private func configureAppearance() {
        leftLabel.numberOfLines = 0
        rightLabel.numberOfLines = 0

        leftLabel.font = UIFont.systemFont(ofSize: 18)
        rightLabel.font = UIFont.systemFont(ofSize: 16)

        leftLabel.textColor = .black
        rightLabel.textColor = .gray
    }
    
}
