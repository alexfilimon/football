//
//  TeamDetailPresenter.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import CoreData
import Foundation

final class TeamDetailPresenter: TeamDetailViewOutput, TeamDetailModuleInput {

    // MARK: - Properties

    weak var view: TeamDetailViewInput?
    var router: TeamDetailRouterInput?
    var output: TeamDetailModuleOutput?

    private lazy var context = CoreDataManager.shared.persistentContainer.viewContext

    private var name: String?
    private var address: String?

    private var team: Team?

    // MARK: - TeamDetailViewOutput

    func viewLoaded() {
        view?.configure(with: team == nil ? .create : .edit)

        view?.setName(name)
        view?.setAddress(address)
        view?.setCountPlayers(team?.players?.count ?? 0)
    }

    func save() {
        saveTeam()
        router?.dismiss()
    }

    func nameEdited(_ text: String?) {
        name = text
    }

    func addressEdited(_ text: String?) {
        address = text
    }

    func playersSelected() {
        // TODO: сделать валидацию: точно ли сохранились? может do/catch сделать
        saveTeam()

        if let team = team {
            router?.showPlayers(with: team, output: self)
        }
    }

    // MARK: - TeamDetailModuleInput

    func set(team: Team?) {
        self.team = team

        name = team?.name
        address = team?.address
    }

    private func saveTeam() {
        if team == nil {
            team = Team(context: context)
            team?.id = UUID()
        }
        team?.name = name
        team?.address = address

        if context.hasChanges {
            try? context.save()
            output?.teamUpdated()
        }
    }

}

extension TeamDetailPresenter: PlayerListModuleOutput {
    func playersUpdated() {
        view?.setCountPlayers(team?.players?.count ?? 0)
    }
}
