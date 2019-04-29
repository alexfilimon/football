//
//  GameDetailRouterInput.swift
//  Football
//
//  Created by Alexander Filimonov on 29/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import Foundation

protocol GameDetailRouterInput {
    func dismiss()
    func showTeamList(output: TeamListModuleOutput?)
}
