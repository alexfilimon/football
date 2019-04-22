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

    // MARK: - PlayerListViewOutput

    func viewLoaded() {
        loadData()
    }

    func playerSelected(_ player: Player) {
        router?.showPlayerDetail(with: player, output: self)
    }

    func addPlayer() {
//        let entity = Player(context: context)
//        entity.name = ["alex", "ivan", "some"].randomElement()
//        entity.address = "some address"
//        entity.email = "email"
//        entity.id = UUID()
//        entity.phone = "+7 888 999 11 22"
//        try? context.save()
//
//        loadData()
        router?.showPlayerDetail(with: nil, output: self)
    }

    // MARK: - Private methods

    private func loadData() {
        let request: NSFetchRequest<Player> = Player.fetchRequest()
        let players = (try? context.fetch(request)) ?? []
        self.players = players
        view?.showPlayers(players)
    }

}

extension PlayerListPresenter: PlayerDetailModuleOutput {
    func playerUpdated() {
        loadData()
    }
}
