//
//  PlayerListTableCellGenerator.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation
import ReactiveDataDisplayManager

final class PlayerListTableCellGenerator: SelectableItem {

    // MARK: - Private properties

    let title: String
    let description: String

    // MARK: - Public properties

    var didSelectEvent = BaseEvent<Void>()
    var didRemoveEvent = BaseEvent<Void>()

    // MARK: - Initialization and deinitialization

    init(title: String, description: String) {
        self.title = title
        self.description = description
    }

}

// MARK: - TableCellGenerator

extension PlayerListTableCellGenerator: TableCellGenerator, ViewBuilder {
    var identifier: UITableViewCell.Type {
        return PlayerListTableViewCell.self
    }

    func build(view: PlayerListTableViewCell) {
        view.configure(with: title, description: description)
    }
}

// MARK: - SwipeActionableGenerator

extension PlayerListTableCellGenerator: SwipeActionableGenerator {
    func getLeadingActions() -> [UIContextualAction] {
        return []
    }
    func getTrailingActions() -> [UIContextualAction] {
        let removeAction = UIContextualAction(style: .destructive, title: "Удалить") { [weak self] (_, _, _) in
            self?.didRemoveEvent.invoke(with: ())
        }
        return [removeAction]
    }
}
