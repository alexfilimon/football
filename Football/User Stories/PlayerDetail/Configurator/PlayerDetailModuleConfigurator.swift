//
//  PlayerDetailModuleConfigurator.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit

final class PlayerDetailModuleConfigurator {

    // MARK: - Internal methods

    func configure(player: Player? = nil, team: Team? = nil, output: PlayerDetailModuleOutput? = nil) -> PlayerDetailViewController {
        guard let view = UIStoryboard(
            name: String(describing: PlayerDetailViewController.self),
            bundle: Bundle.main
        ).instantiateInitialViewController() as? PlayerDetailViewController else {
            fatalError("Can't load PlayerDetailViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = PlayerDetailPresenter()
        let router = PlayerDetailRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        presenter.configure(with: player)
        presenter.configure(with: team)

        return view
    }

}
