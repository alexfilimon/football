//
//  GameCellGenerator.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import ReactiveDataDisplayManager

final class GameCellGenerator: SelectableItem {

    // MARK: - Private properties

    let game: GameEntity

    // MARK: - Public properties

    var didSelectEvent = BaseEvent<Void>()
    var didRemoveEvent = BaseEvent<Void>()

    // MARK: - Initialization and deinitialization

    init(game: GameEntity) {
        self.game = game
    }

}

// MARK: - TableCellGenerator

extension GameCellGenerator: TableCellGenerator, ViewBuilder {
    var identifier: UITableViewCell.Type {
        return GameTableCell.self
    }

    func build(view: GameTableCell) {
        view.configure(with: game)
    }
}

// MARK: - SwipeActionableGenerator

extension GameCellGenerator: SwipeActionableGenerator {
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
