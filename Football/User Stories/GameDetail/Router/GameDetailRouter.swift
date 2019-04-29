//
//  GameDetailRouter.swift
//  Football
//
//  Created by Alexander Filimonov on 29/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit

final class GameDetailRouter: GameDetailRouterInput {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

	// MARK: - GameDetailRouterInput

    func dismiss() {
        view?.pop(animated: true)
    }

    func showTeamList(output: TeamListModuleOutput? = nil) {
        let controller = TeamListModuleConfigurator().configure(with: .select, output: output)
        view?.push(module: controller, animated: true)
    }

}
