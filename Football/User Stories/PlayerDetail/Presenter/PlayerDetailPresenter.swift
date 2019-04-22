//
//  PlayerDetailPresenter.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import Foundation

final class PlayerDetailPresenter: PlayerDetailViewOutput, PlayerDetailModuleInput {

    // MARK: - Properties

    weak var view: PlayerDetailViewInput?
    var router: PlayerDetailRouterInput?
    var output: PlayerDetailModuleOutput?

    // MARK: - Properties

    private var name: String?
    private var phone: String?
    private var email: String?
    private var address: String?

    private var player: Player?

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

    func save() {
        if player == nil {
            player = Player(context: context)
            player?.id = UUID()
        }
        player?.name = name
        player?.address = address
        player?.email = email
        player?.phone = phone
        try? context.save()

        output?.playerUpdated()
        router?.dismiss()
    }

    func viewLoaded() {
        view?.configure(with: player == nil ? .create : .edit)
    }

    // MARK: - PlayerDetailModuleInput

    func configure(with player: Player?) {
        self.player = player

        name = player.name
        email = player.email
        phone = player.phone
        address = player.address
    }

}
