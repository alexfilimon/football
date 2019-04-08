//
//  GamesListViewOutput.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

protocol GamesListViewOutput {
    func viewLoaded()
    func gameSelected(game: GameRealmEntry)
    func gameDelete(game: GameRealmEntry)
    func addGame()
}
