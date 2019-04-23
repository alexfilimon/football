//
//  GamesListTableDataDisplayManager.swift
//  Football
//
//  Created by Alexander Filimonov on 30/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import UIKit
import ReactiveDataDisplayManager

protocol SwipeActionableGenerator {
    func getLeadingActions() -> [UIContextualAction]
    func getTrailingActions() -> [UIContextualAction]
}

final class ActionableTableDataDisplayManager: BaseTableDataDisplayManager {
    func tableView(
        _ tableView: UITableView,
        leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath
    ) -> UISwipeActionsConfiguration? {
        let generator = cellGenerators[indexPath.section][indexPath.row]
        guard let actionableGenerator = generator as? SwipeActionableGenerator else {
            return nil
        }
        return UISwipeActionsConfiguration(actions: actionableGenerator.getLeadingActions())
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let generator = cellGenerators[indexPath.section][indexPath.row]
        guard let actionableGenerator = generator as? SwipeActionableGenerator else {
            return nil
        }
        let configurator = UISwipeActionsConfiguration(actions: actionableGenerator.getTrailingActions())
        configurator.performsFirstActionWithFullSwipe = false
        return configurator
    }
}
