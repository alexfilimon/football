//
//  GameJSONStore.swift
//  Football
//
//  Created by Alexander Filimonov on 25/03/2019.
//  Copyright © 2019 Александр Филимонов. All rights reserved.
//

import Foundation

final class GameJSONStore: GameAbstractStore {

    // MARK: - Constants

    private enum Constants {
        static let fileName = "games_db.json"
    }

    // MARK: - Properties

    private let manager = FileManager.default

    // MARK: - GameAbstractStore

    func add(game: GameEntity) {
        var allGames = loadGames()
        allGames.append(game)
        saveGames(allGames)
    }

    @discardableResult func update(game: GameEntity) -> Bool {
        var allGames = loadGames()
        guard let index = getIndex(of: game, in: allGames) else {
            return false
        }
        allGames[index] = game
        saveGames(allGames)
        return true
    }

    func remove(at id: Int) {
        var allGames = loadGames()
        guard let index = getIndexOfGame(with: id, in: allGames) else {
            return
        }
        allGames.remove(at: index)
        saveGames(allGames)
    }

    func removeAll() {
        saveGames([])
    }

    func get(by id: Int) -> GameEntity? {
        let allGames = loadGames()
        guard let index = getIndexOfGame(with: id, in: allGames) else {
            return nil
        }
        return allGames[index]
    }

    func getAll() -> [GameEntity] {
        return loadGames()
    }

    func generateId() -> Int {
        let allGames = loadGames()
        let ids = allGames.map { $0.id }
        return (ids.max() ?? -1) + 1
    }

    // MARK: - Private methods

    private func getIndex(of game: GameEntity,
                          in games: [GameEntity]) -> Array<Any>.Index? {
        return getIndexOfGame(with: game.id, in: games)
    }

    private func getIndexOfGame(with id: Int,
                                in games: [GameEntity]) -> Array<Any>.Index? {
        let foundIndex = games.firstIndex { $0.id == id }
        guard let foundUnwrapIndex = foundIndex else {
            return nil
        }
        return foundUnwrapIndex
    }

    private func loadData() -> Data? {
        guard
            let url = url(for: Constants.fileName),
            manager.fileExists(atPath: url.path)
        else { return nil }
        return manager.contents(atPath: url.path)
    }

    private func saveData(_ data: Data) {
        guard let url = url(for: Constants.fileName) else {
            return
        }
        if manager.fileExists(atPath: url.path) {
            try? manager.removeItem(at: url)
        }
        manager.createFile(atPath: url.path, contents: data, attributes: nil)
    }

    private func loadGames() -> [GameEntity] {
        guard let data = loadData() else {
            return []
        }
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        let entities = try? decoder.decode([GameEntity].self, from: data)
        return entities ?? []
    }

    private func saveGames(_ games: [GameEntity]) {
        let encoder = JSONEncoder()
        encoder.keyEncodingStrategy = .convertToSnakeCase
        encoder.dateEncodingStrategy = .iso8601
        guard let data = try? encoder.encode(games) else {
            return
        }
        saveData(data)
    }

    private func url(for fileName: String) -> URL? {
        return manager
                .urls(for: .documentDirectory, in: .userDomainMask)
                .first?
                .appendingPathComponent(fileName, isDirectory: false)
    }

}
