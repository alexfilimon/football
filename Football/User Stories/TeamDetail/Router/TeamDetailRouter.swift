//
//  TeamDetailRouter.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit

final class TeamDetailRouter: TeamDetailRouterInput {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

	// MARK: - TeamDetailRouterInput

    func dismiss() {
        view?.pop(animated: true)
    }

    func showPlayers(with team: Team, output: PlayerListModuleOutput? = nil) {
        let controller = PlayerListModuleConfigurator().configure(for: team, output: output)
        view?.push(module: controller, animated: true)
    }

}
