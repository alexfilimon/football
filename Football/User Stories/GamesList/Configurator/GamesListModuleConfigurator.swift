//
//  GamesListModuleConfigurator.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit

final class GamesListModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: GamesListModuleOutput? = nil) -> GamesListViewController {
        guard let view = UIStoryboard(name: String(describing: GamesListViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? GamesListViewController else {
            fatalError("Can't load GamesListViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = GamesListPresenter()
        let router = GamesListRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
