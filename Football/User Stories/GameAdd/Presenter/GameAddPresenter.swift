//
//  GameAddPresenter.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import Foundation

final class GameAddPresenter: GameAddViewOutput, GameAddModuleInput {

    // MARK: - Properties

    weak var view: GameAddViewInput?
    var router: GameAddRouterInput?
    var output: GameAddModuleOutput?

    // MARK: - Private properties

    private var hostTeamName: String?
    private var visitorTeamName: String?
    private var hostTeamScore: Int?
    private var visitorTeamScore: Int?
    private var address: String?
    private var date: Date?

    private var editingGameId: Int?

    private var isNewGame: Bool {
        return editingGameId == nil
    }

    // MARK: - GameAddViewOutput

    func viewLoaded() {
        view?.updateTextFields(hostTeamName: hostTeamName,
                               visitorTeamName: visitorTeamName,
                               hostTeamScore: hostTeamScore,
                               visitorTeamScore: visitorTeamScore,
                               address: address,
                               date: date)
        if isNewGame {
            view?.setTitle("Добавить")
        } else {
            view?.setTitle("Редактировать")
        }
    }

    func cancel() {
        router?.dismiss()
    }

    func save() {
        guard let hostTeamName = hostTeamName,
            !hostTeamName.isEmpty,
            let visitorTeamName = visitorTeamName,
            !visitorTeamName.isEmpty
        else {
            router?.showError(title: "Ошибка", message: "Заполните названия команд")
            return
        }
        guard let hostTeamScore = hostTeamScore,
            let visitorTeamScore = visitorTeamScore
            else {
                router?.showError(title: "Ошибка", message: "Заполните правильно счет комманд")
                return
        }
        guard let date = date else {
            router?.showError(title: "Ошибка", message: "Заполните дату игры")
            return
        }
        guard let address = address else {
            router?.showError(title: "Ошибка", message: "Заполните адрес проведения игры")
            return
        }

        // adding game to store
        let store = GameJSONStore()
        let hostTeam = TeamEntity(name: hostTeamName)
        let visitorTeam = TeamEntity(name: visitorTeamName)
        if let editingGameId = editingGameId {
            let game = GameEntity(id: editingGameId,
                                  score: Score(hostScore: hostTeamScore,
                                               visitorScore: visitorTeamScore),
                                  hostTeam: hostTeam,
                                  visitorTeam: visitorTeam,
                                  date: date,
                                  address: address)
            store.update(game: game)
        } else {
            let game = GameEntity(id: store.generateId(),
                                  score: Score(hostScore: hostTeamScore,
                                               visitorScore: visitorTeamScore),
                                  hostTeam: hostTeam,
                                  visitorTeam: visitorTeam,
                                  date: date,
                                  address: address)
            store.add(game: game)
        }

        output?.needUpdate()
        router?.dismiss()
    }

    func setHostTeam(_ string: String) {
        hostTeamName = string
    }

    func setVisitorTeam(_ string: String) {
        visitorTeamName = string
    }

    func setHostScore(_ string: String) {
        hostTeamScore = Int(string)
    }

    func setVisitorScore(_ string: String) {
        visitorTeamScore = Int(string)
    }

    func setDate(_ date: Date) {
        self.date = date
    }

    func setAddress(_ string: String) {
        address = string
    }

    // MARK: - GameAddModuleInput

    func set(gameForEditing: GameEntity) {
        editingGameId = gameForEditing.id
        date = gameForEditing.date
        hostTeamScore = gameForEditing.score.hostScore
        visitorTeamScore = gameForEditing.score.visitorScore
        hostTeamName = gameForEditing.hostTeam.name
        visitorTeamName = gameForEditing.visitorTeam.name
        address = gameForEditing.address
    }

}
