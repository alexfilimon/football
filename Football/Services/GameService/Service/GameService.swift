//
//  GameService.swift
//  Football
//
//  Created by Alexander Filimonov on 25/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation

final class GameService: GameAbstractService {

    // MARK: - Private methods

    private let store: GameAbstractStore

    // MARK: - Initialization and deinitialization

    public init(with store: GameAbstractStore) {
        self.store = store
    }

    // MARK: - GameAbstractService

    func getGames(onCompleted: @escaping GamesListClosure,
                  onError: @escaping (GameServiceError) -> Void) {

    }

    func getGame(at id: Int,
                 onCompleted: @escaping GameClosure,
                 onError: @escaping (GameServiceError) -> Void) {

    }

    func addGame(_ game: GameEntity,
                 onCompleted: @escaping EmptyClosure,
                 onError: @escaping (GameServiceError) -> Void) {

    }

    func removeGame(with id: Int,
                    onCompleted: @escaping GameClosure,
                    onError: @escaping (GameServiceError) -> Void) {

    }
}