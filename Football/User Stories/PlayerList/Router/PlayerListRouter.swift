//
//  PlayerListRouter.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit

final class PlayerListRouter: PlayerListRouterInput {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

	// MARK: - PlayerListRouterInput

    func showPlayerDetail(with player: Player? = nil,
                          team: Team?,
                          output: PlayerDetailModuleOutput? = nil) {
        let module = PlayerDetailModuleConfigurator().configure(player: player, team: team, output: output)
        view?.push(module: module, animated: true)
    }

}
