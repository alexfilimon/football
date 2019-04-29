//
//  GameHeader.swift
//  Football
//
//  Created by Alexander Filimonov on 29/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import UIKit

class GameHeader: UIView {

    // MARK: - Subviews

    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    // MARK: - Public configurators

    public func configure(with title: String) {
        titleLabel.text = title
    }

    // MARK: - Private configurators

    private func setUp() {
        initFromNib()
        configureBaseUI()
    }

    private func configureBaseUI() {
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        backgroundColor = Color.delimeter
    }

}
