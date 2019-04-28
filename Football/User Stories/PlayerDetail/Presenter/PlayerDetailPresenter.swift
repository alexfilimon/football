//
//  PlayerDetailPresenter.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import Foundation

final class PlayerDetailPresenter: PlayerDetailViewOutput, PlayerDetailModuleInput {

    // MARK: - Nested types

    private enum Constants {
        static let defaultNumber: Int16 = 10
    }

    // MARK: - Properties

    weak var view: PlayerDetailViewInput?
    var router: PlayerDetailRouterInput?
    var output: PlayerDetailModuleOutput?

    // MARK: - Properties

    private var name: String?
    private var phone: String?
    private var email: String?
    private var address: String?
    private var number: Int16 = Constants.defaultNumber

    private var player: Player?
    private var team: Team?

    private var context = CoreDataManager.shared.persistentContainer.viewContext

    // MARK: - PlayerDetailViewOutput

    func nameEdited(_ text: String?) {
        name = text
    }

    func emailEdited(_ text: String?) {
        email = text
    }

    func phoneEdited(_ text: String?) {
        phone = text
    }

    func addressEdited(_ text: String?) {
        address = text
    }

    func numberEdited(_ num: Int16) {
        number = num
    }

    func save() {
        guard isValid() else {
            return
        }

        if player == nil {
            player = Player(context: context)
            player?.id = UUID()
        }
        player?.name = name
        player?.address = address
        player?.email = email
        player?.phone = phone
        player?.number = number
        player?.team = team

        if context.hasChanges {
            try? context.save()
        }

        output?.playerUpdated()
        router?.dismiss()
    }

    func viewLoaded() {
        view?.configure(with: player == nil ? .create : .edit)

        view?.setName(name)
        view?.setEmail(email)
        view?.setPhone(phone)
        view?.setAddress(address)
        view?.setNumber(number)
    }

    // MARK: - PlayerDetailModuleInput

    func configure(with player: Player?) {
        self.player = player

        name = player?.name
        email = player?.email
        phone = player?.phone
        address = player?.address
        number = player?.number ?? Constants.defaultNumber
    }

    func configure(with team: Team?) {
        self.team = team
    }

    private func isValid() -> Bool {
        guard let name = name else {
            view?.show(type: .error, title: "Ошибка", description: "Заполните все обязателные поля")
            return false
        }

        if name.count < 3 {
            view?.show(type: .error, title: "Ошибка", description: "Заполните поле 'Имя' правильно")
            return false
        }

        if let email = email {
            if !Validator.isValidEmail(testStr: email) {
                view?.show(type: .error, title: "Ошибка", description: "Заполните поле 'Email' правильно")
                return false
            }
        }

        if number < 1 || number > 99 {
            view?.show(type: .error, title: "Ошибка", description: "Номер игрока должен быть больше 0 и меньше 100")
            return false
        }

        return true
    }

}
