//
//  GamesListViewState.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

enum GamesListViewState {
    case data(games: [GameEntity])
    case error(error: GameServiceError)
}
