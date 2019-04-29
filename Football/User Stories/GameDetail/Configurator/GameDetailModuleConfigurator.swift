//
//  GameDetailModuleConfigurator.swift
//  Football
//
//  Created by Alexander Filimonov on 29/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit

final class GameDetailModuleConfigurator {

    // MARK: - Internal methods

    func configure(game: Game? = nil, output: GameDetailModuleOutput? = nil) -> GameDetailViewController {
        guard let view = UIStoryboard(name: String(describing: GameDetailViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? GameDetailViewController else {
            fatalError("Can't load GameDetailViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = GameDetailPresenter()
        let router = GameDetailRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        presenter.configure(with: game)

        return view
    }

}
