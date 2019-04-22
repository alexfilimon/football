//
//  PlayerListRouterInput.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import Foundation

protocol PlayerListRouterInput {
    func showPlayerDetail(with player: Player?, output: PlayerDetailModuleOutput?)
}
