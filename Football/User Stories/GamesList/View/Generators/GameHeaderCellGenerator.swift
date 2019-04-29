//
//  GameHeaderCellGenerator.swift
//  Football
//
//  Created by Alexander Filimonov on 29/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation
import ReactiveDataDisplayManager

final class GameHeaderCellGenerator: TableHeaderGenerator {

    // MARK: - Properties

    private var view = GameHeader()

    // MARK: - Initialization

    init(with title: String) {
        view.configure(with: title)
    }

    // MARK: - TableHeaderGenerator

    override func generate() -> UIView {
        return view
    }

    override func height(_ tableView: UITableView, forSection section: Int) -> CGFloat {
        return 30
    }
}
