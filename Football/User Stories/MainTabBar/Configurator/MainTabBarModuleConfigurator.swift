//
//  MainTabBarModuleConfigurator.swift
//  Football
//
//  Created by Alexander Filimonov on 28/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit

final class MainTabBarModuleConfigurator {

    // MARK: - Internal methods

    func configure(output: MainTabBarModuleOutput? = nil) -> MainTabBarViewController {
        guard let view = UIStoryboard(name: String(describing: MainTabBarViewController.self),
                                      bundle: Bundle.main).instantiateInitialViewController() as? MainTabBarViewController else {
            fatalError("Can't load MainTabBarViewController from storyboard, check that controller is initial view controller")
        }
        let presenter = MainTabBarPresenter()
        let router = MainTabBarRouter()

        presenter.view = view
        presenter.router = router
        presenter.output = output
        router.view = view
        view.output = presenter

        presenter.setTabs([.games, .teams])

        return view
    }

}
