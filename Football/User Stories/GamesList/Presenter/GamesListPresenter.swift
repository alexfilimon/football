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

    private lazy var store: GameAbstractStore = GameJSONStore()

    // MARK: - GamesListViewOutput

    func viewLoaded() {
        reloadAllData()
    }

    func gameSelected(game: GameEntity) {
        router?.showDetail(game: game, output: self)
    }

    func gameDelete(game: GameEntity) {
        router?.showRemoveAlert(for: game, onRemove: { [weak self] in
            self?.store.remove(at: game.id)
            self?.reloadAllData()
        })
    }

    func addGame() {
        router?.addGame(output: self)
    }

    // MARK: - GamesListModuleInput

    // MARK: - Private methods

    private func reloadAllData() {
        view?.configure(with: .data(games: store.getAll()))
    }

}

// MARK: - GameAddModuleOutput

extension GamesListPresenter: GameAddModuleOutput {
    func needUpdate() {
        reloadAllData()
    }
}
