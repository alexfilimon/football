//
//  TeamDetailModuleConfigurator.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit

final class TeamDetailModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: TeamDetailModuleOutput? = nil) -> TeamDetailViewController {
        guard let view = UIStoryboard(name: String(describing: TeamDetailViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? TeamDetailViewController else {
            fatalError("Can't load TeamDetailViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = TeamDetailPresenter()
        let router = TeamDetailRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        return view
    }

}
