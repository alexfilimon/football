//
//  GamesListPresenter.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

final class GamesListPresenter: GamesListViewOutput, GamesListModuleInput {

    // MARK: - Properties

    weak var view: GamesListViewInput?
    var router: GamesListRouterInput?
    var output: GamesListModuleOutput?

    // MARK: - Private properties

    private lazy var context: StorageContext? = try? RealmStorageContext()

    // MARK: - GamesListViewOutput

    func viewLoaded() {
        reloadAllData()
    }

    func gameSelected(game: GameRealmEntry) {
        router?.showDetail(game: game, output: self)
    }

    func gameDelete(game: GameRealmEntry) {
        router?.showRemoveAlert(for: game, onRemove: { [weak self] in
            try? self?.context?.delete(object: game)
            self?.reloadAllData()
        })
    }

    func addGame() {
        router?.addGame(output: self)
    }

    // MARK: - GamesListModuleInput

    // MARK: - Private methods

    private func reloadAllData() {
        context?.fetch(GameRealmEntry.self, predicate: nil, sorted: Sorted(key: "id", ascending: true), completion: { [weak self] games in
            self?.view?.configure(with: .data(games: games))
        })
    }

}

// MARK: - GameAddModuleOutput

extension GamesListPresenter: GameAddModuleOutput {
    func needUpdate() {
        reloadAllData()
    }
}
