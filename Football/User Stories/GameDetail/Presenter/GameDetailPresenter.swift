//
//  GameDetailPresenter.swift
//  Football
//
//  Created by Alexander Filimonov on 29/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import Foundation

final class GameDetailPresenter: GameDetailViewOutput, GameDetailModuleInput {

    // MARK: - Nested types

    private enum SelectionTeam {
        case host
        case visitor
    }

    private enum Constants {
        static let defaultTeamName = "None"
    }

    // MARK: - Properties

    weak var view: GameDetailViewInput?
    var router: GameDetailRouterInput?
    var output: GameDetailModuleOutput?

    // MARK: - Private properties

    private var game: Game?

    private var date: Date = Date()
    private var address: String?
    private var score = Score()

    private var hostTeam: Team?
    private var visitorTeam: Team?

    private lazy var context = CoreDataManager.shared.persistentContainer.viewContext
    private var selectionTeam: SelectionTeam?

    // MARK: - GameDetailViewOutput

    func viewLoaded() {
        view?.configure(with: game == nil ? .create : .edit)

        view?.setDate(date)
        view?.setAddress(address)
        view?.setHostScore(score.hostScore)
        view?.setVisitorScore(score.visitorScore)
        view?.setHostTeam(with: hostTeam?.name ?? Constants.defaultTeamName)
        view?.setVisitorTeam(with: visitorTeam?.name ?? Constants.defaultTeamName)
    }

    func save() {
        guard isValid() else {
            return
        }
        _save()
        output?.needUpdate()
        router?.dismiss()
    }

    func addressEdited(_ text: String?) {
        address = text
    }

    func dateEdited(_ date: Date) {
        self.date = date
    }

    func hostScoreEdited(_ score: Int) {
        self.score.hostScore = score
    }

    func visitorScoreEdited(_ score: Int) {
        self.score.visitorScore = score
    }

    func hostTeamSelected() {
        selectionTeam = .host
        router?.showTeamList(output: self)
    }

    func visitorTeamSelected() {
        selectionTeam = .visitor
        router?.showTeamList(output: self)
    }

    // MARK: - GameDetailModuleInput

    func configure(with game: Game?) {
        self.game = game

        date = (game?.date as Date?) ?? Date()
        address = game?.address
        score = Score(game?.score ?? "")
        hostTeam = game?.hostTeam
        visitorTeam = game?.visitorTeam
    }

    // MARK: - Private properties

    private func isValid() -> Bool {

        if hostTeam == nil {
            view?.show(type: .error, title: "Ошибка", description: "Команда хозяев не задана")
            return false
        }

        if visitorTeam == nil {
            view?.show(type: .error, title: "Ошибка", description: "Команда гостей не задана")
            return false
        }

        if visitorTeam?.id == hostTeam?.id {
            view?.show(type: .error, title: "Ошибка", description: "Команды должны быть разными")
            return false
        }

        return true
    }

    private func _save() {
        if game == nil {
            game = Game(context: context)
            game?.id = UUID()
        }
        game?.address = address
        game?.date = date as NSDate
        game?.score = score.toString()
        game?.hostTeam = hostTeam
        game?.visitorTeam = visitorTeam

        if context.hasChanges {
            try? context.save()
        }
    }

}

extension GameDetailPresenter: TeamListModuleOutput {
    func teamSelected(_ team: Team) {
        guard let selectionTeam = selectionTeam else {
            return
        }
        switch selectionTeam {
        case .host:
            hostTeam = team
            view?.setHostTeam(with: team.name ?? Constants.defaultTeamName)
        case .visitor:
            visitorTeam = team
            view?.setVisitorTeam(with: team.name ?? Constants.defaultTeamName)
        }
    }
}
