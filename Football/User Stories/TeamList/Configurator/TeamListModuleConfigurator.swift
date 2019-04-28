//
//  TeamListModuleConfigurator.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit

final class TeamListModuleConfigurator {

    // MARK: - Internal methods

    func configure(with type: TeamListType, output: TeamListModuleOutput? = nil) -> TeamListViewController {
        guard let view = UIStoryboard(name: String(describing: TeamListViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? TeamListViewController else {
            fatalError("Can't load TeamListViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = TeamListPresenter(type: type)
        let router = TeamListRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
