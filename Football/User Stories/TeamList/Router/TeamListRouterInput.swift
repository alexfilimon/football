//
//  TeamListRouterInput.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import Foundation

protocol TeamListRouterInput {
    func showTeamDetail(_ team: Team?, output: TeamDetailModuleOutput?)
}
