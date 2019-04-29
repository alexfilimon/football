//
//  TeamListRouter.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit

final class TeamListRouter: TeamListRouterInput {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

	// MARK: - TeamListRouterInput

    func showTeamDetail(_ team: Team?, output: TeamDetailModuleOutput? = nil) {
        let module = TeamDetailModuleConfigurator().configure(team: team, output: output)
        view?.push(module: module, animated: true, hideTabBar: true)
    }

    func dismiss() {
        view?.pop(animated: true)
    }

}
