//
//  PlayerListModuleConfigurator.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit

final class PlayerListModuleConfigurator {

    // MARK: - Internal methods

    func configure(for team: Team? = nil, output: PlayerListModuleOutput? = nil) -> PlayerListViewController {
        guard let view = UIStoryboard(name: String(describing: PlayerListViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? PlayerListViewController else {
            fatalError("Can't load PlayerListViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = PlayerListPresenter()
        let router = PlayerListRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        presenter.set(team: team)

        return view
    }

}
