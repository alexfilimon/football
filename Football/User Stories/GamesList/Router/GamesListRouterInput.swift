//
//  GamesListRouterInput.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import Foundation

protocol GamesListRouterInput {
    func addGame(output: GameAddModuleOutput?)
    func showRemoveAlert(for game: GameRealmEntry, onRemove: @escaping EmptyClosure)
    func showDetail(game: GameRealmEntry, output: GameAddModuleOutput?)
}
