//
//  GameAddModuleConfigurator.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit

final class GameAddModuleConfigurator {

    // MARK: - Internal methods

    func configure(editingGame: GameEntity? = nil,
                   output: GameAddModuleOutput? = nil) -> GameAddViewController {
        guard let view = UIStoryboard(name: String(describing: GameAddViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? GameAddViewController else {
            fatalError("Can't load GameAddViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = GameAddPresenter()
        let router = GameAddRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        if let editingGame = editingGame {
            presenter.set(gameForEditing: editingGame)
        }

        return view
    }

}
