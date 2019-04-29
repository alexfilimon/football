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
    private var teams: [(key: String, value: [Team])] = []
    private let type: TeamListType

    // MARK: - Initialization

    public init(type: TeamListType) {
        self.type = type
    }

    // MARK: - TeamListViewOutput

    func viewLoaded() {
        view?.configure(with: type)
        loadData()
    }

    func teamSelected(_ team: Team) {
        switch type {
        case .default:
            router?.showTeamDetail(team, output: self)
        case .select:
            output?.teamSelected(team)
            router?.dismiss()
        }
    }

    func addTeam() {
        router?.showTeamDetail(nil, output: self)
    }

    func removeTeam(_ team: Team) {
        context.delete(team)
        try? context.save()
        loadData()
        view?.configure(with: teams)
    }

    // MARK: - TeamListModuleInput

    // MARK: - Private methods

    private func loadData() {
        let request: NSFetchRequest<Team> = Team.fetchRequest()
        let teams = (try? context.fetch(request)) ?? []

        let teamsDict = Dictionary(grouping: teams) { (element) -> String in
            if let name = element.name, let char = name.first {
                return String(char).uppercased()
            }
            return "Undefined"
        }
        self.teams = teamsDict.sorted(by: { (left, right) -> Bool in
            return left.key < right.key
        })

        view?.configure(with: self.teams)
    }

}

extension TeamListPresenter: TeamDetailModuleOutput {
    func teamUpdated() {
        loadData()
    }
}
