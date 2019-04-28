//
//  PlayerListPresenter.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import CoreData

final class PlayerListPresenter: PlayerListViewOutput, PlayerListModuleInput {

    // MARK: - Properties

    weak var view: PlayerListViewInput?
    var router: PlayerListRouterInput?
    var output: PlayerListModuleOutput?

    // MARK: - Properties

    private var context = CoreDataManager.shared.persistentContainer.viewContext
    private var players: [Player] = []
    private var team: Team?

    // MARK: - PlayerListViewOutput

    func viewLoaded() {
        loadData()
    }

    func playerSelected(_ player: Player) {
        router?.showPlayerDetail(with: player, team: team, output: self)
    }

    func addPlayer() {
        router?.showPlayerDetail(with: nil, team: team, output: self)
    }

    func removePlayer(_ player: Player) {
        context.delete(player)
        try? context.save()
        players.removeAll(where: { $0.id == player.id })
        view?.showPlayers(players)
        output?.playersUpdated()
    }

    // MARK: - PlayerListModuleInput

    func set(team: Team?) {
        self.team = team
    }

    // MARK: - Private methods

    private func loadData() {
        let request: NSFetchRequest<Player> = Player.fetchRequest()
        if let team = team {
            request.predicate = NSPredicate(format: "team = %@", argumentArray: [team])
            request.sortDescriptors = [NSSortDescriptor(key: "number", ascending: true)]
        }
        let players = (try? context.fetch(request)) ?? []
        self.players = players
        view?.showPlayers(players)
    }

}

extension PlayerListPresenter: PlayerDetailModuleOutput {
    func playerUpdated() {
        loadData()
        output?.playersUpdated()
    }
}
