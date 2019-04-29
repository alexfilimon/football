//
//  GamesListPresenter.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import CoreData
import Foundation

final class GamesListPresenter: GamesListViewOutput, GamesListModuleInput {

    // MARK: - Properties

    weak var view: GamesListViewInput?
    var router: GamesListRouterInput?
    var output: GamesListModuleOutput?

    // MARK: - Private properties

    private lazy var context = CoreDataManager.shared.persistentContainer.viewContext
    private var games: [(key: Date?, value: [Game])] = []

    // MARK: - GamesListViewOutput

    func viewLoaded() {
        reloadAllData()
    }

    func gameSelected(game: Game) {
        router?.showDetail(game: game, output: self)
    }

    func gameDelete(game: Game) {
        router?.showRemoveAlert(for: game, onRemove: { [weak self] in
            self?.context.delete(game)
            try? self?.context.save()
            self?.reloadAllData()
        })
    }

    func addGame() {
        router?.addGame(output: self)
    }

    // MARK: - GamesListModuleInput

    // MARK: - Private methods

    private func reloadAllData() {
        let request: NSFetchRequest<Game> = Game.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "date", ascending: true)]
        let games = (try? context.fetch(request)) ?? []

        var gamesDict = Dictionary(grouping: games) { (game) -> Date? in
            guard let date = game.date as Date? else {
                return nil
            }
            let dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: date)
            return Calendar.current.date(from: dateComponents)
        }

        self.games = gamesDict.sorted { (left, right) -> Bool in
            guard let leftDate = left.key, let rightDate = right.key else {
                return false
            }
            return leftDate > rightDate
        }

        view?.configure(with: self.games)
    }

}

// MARK: - GameAddModuleOutput

extension GamesListPresenter: GameDetailModuleOutput {
    func needUpdate() {
        reloadAllData()
    }
}
