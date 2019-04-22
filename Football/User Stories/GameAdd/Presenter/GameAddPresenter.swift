//
//  GameAddPresenter.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import Foundation
import CoreData

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

    private var editingGameId: UUID?

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
//        let hostTeam = TeamEntity(name: hostTeamName)
//        let visitorTeam = TeamEntity(name: visitorTeamName)
        if let editingGameId = editingGameId {
            let context = CoreDataManager.shared.persistentContainer.viewContext
            let game = Game(context: context)
            
        } else {

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

    func set(gameForEditing: Game) {
        editingGameId = gameForEditing.id
        date = gameForEditing.date as Date?
        hostTeamScore = Score(gameForEditing.score ?? "").hostScore
        visitorTeamScore = Score(gameForEditing.score ?? "").visitorScore
        hostTeamName = gameForEditing.hostTeam?.name
        visitorTeamName = gameForEditing.visitorTeam?.name
        address = gameForEditing.address
    }

}
