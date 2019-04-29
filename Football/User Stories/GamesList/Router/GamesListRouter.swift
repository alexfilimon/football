//
//  GamesListRouter.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit

final class GamesListRouter: GamesListRouterInput {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

	// MARK: - GamesListRouterInput

    func addGame(output: GameDetailModuleOutput? = nil) {
        let detailGameController = GameDetailModuleConfigurator().configure(output: output)
        view?.push(module: detailGameController, animated: true, hideTabBar: true)
    }

    func showRemoveAlert(for game: Game, onRemove: @escaping EmptyClosure) {
        let alertController = UIAlertController(title: "Удалить?", message: "Вы действительно хотете удалить эту игру?", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Нет", style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: "Да", style: .destructive, handler: { (action) in
            onRemove()
        }))
        view?.presentModule(alertController, animated: true, completion: nil)
    }

    func showDetail(game: Game, output: GameDetailModuleOutput? = nil) {
        let detailGameController = GameDetailModuleConfigurator().configure(game: game, output: output)
        view?.push(module: detailGameController, animated: true, hideTabBar: true)
    }

}
