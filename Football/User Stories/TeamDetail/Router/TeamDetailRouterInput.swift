//
//  TeamDetailRouterInput.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import Foundation

protocol TeamDetailRouterInput {
    func dismiss()
    func showPlayers(with team: Team, output: PlayerListModuleOutput?)
}
