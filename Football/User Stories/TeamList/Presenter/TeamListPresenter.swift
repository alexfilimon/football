//
//  TeamListPresenter.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import CoreData
import Foundation

final class TeamListPresenter: TeamListViewOutput, TeamListModuleInput {

    // MARK: - Properties

    weak var view: TeamListViewInput?
    var router: TeamListRouterInput?
    var output: TeamListModuleOutput?

    private lazy var context = CoreDataManager.shared.persistentContainer.viewContext
    private var teams: [Team] = []
    private let type: TeamListType

    // MARK: - Initialization

    public init(type: TeamListType) {
        self.type = type
    }

    // MARK: - TeamListViewOutput

    func viewLoaded() {
        loadData()
    }

    func teamSelected(_ team: Team) {
        router?.showTeamDetail(team, output: self)
    }

    func addTeam() {
        router?.showTeamDetail(nil, output: self)
    }

    func removeTeam(_ team: Team) {
        context.delete(team)
        teams.removeAll(where: { $0.id == team.id })
        try? context.save()
        view?.configure(with: teams)
    }

    // MARK: - TeamListModuleInput

    // MARK: - Private methods

    private func loadData() {
        let request: NSFetchRequest<Team> = Team.fetchRequest()
        let teams = (try? context.fetch(request)) ?? []
        self.teams = teams

        view?.configure(with: teams)
    }

}

extension TeamListPresenter: TeamDetailModuleOutput {
    func teamUpdated() {
        loadData()
    }
}
