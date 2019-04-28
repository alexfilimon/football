//
//  TeamDetailViewController.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit
import Eureka

final class TeamDetailViewController: FormViewController, TeamDetailViewInput, ModuleTransitionable {

    // MARK: - Nested types

    private enum Constants {
        public enum Row {
            static let name = "name"
            static let address = "address"
            static let players = "players"
        }
    }

    // MARK: - Properties

    var output: TeamDetailViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        configureForm()
        configureNavigationItem()

        output?.viewLoaded()
    }

    // MARK: - TeamDetailViewInput

    func configure(with state: TeamDetailViewStyle) {
        let buttonTitle: String
        let title: String
        switch state {
        case .edit:
            buttonTitle = "Сохранить"
            title = "Изменение"
        case .create:
            buttonTitle = "Добавить"
            title = "Создание"
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: buttonTitle,
            style: .plain,
            target: self,
            action: #selector(save)
        )
        self.navigationItem.title = title
    }

    func setName(_ text: String?) {
        let row: TextRow? = form.rowBy(tag: Constants.Row.name)
        row?.value = text
    }

    func setAddress(_ text: String?) {
        let row: TextRow? = form.rowBy(tag: Constants.Row.address)
        row?.value = text
    }

    func setCountPlayers(_ count: Int) {
        let row: TeamPlayerRow? = form.rowBy(tag: Constants.Row.players)
        row?.value = count
    }

    // MARK: - Actions

    @objc
    private func save() {
        output?.save()
    }

    // MARK: - Private methods

    private func configureNavigationItem() {
         navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
    }

    private func configureForm() {
        form +++ Section("Информация")
            <<< TextRow(Constants.Row.name) {
                $0.title = "Название*"
                $0.placeholder = "Старт"
                $0.validationOptions = .validatesOnChange
            }
            .onChange { [weak self] (row) in
                self?.output?.nameEdited(row.value)
            }

            <<< TextRow(Constants.Row.address) {
                $0.title = "Адрес"
                $0.placeholder = "Воронеж"
                $0.validationOptions = .validatesOnChange
            }
            .onChange { [weak self] (row) in
                self?.output?.addressEdited(row.value)
            }

            <<< TeamPlayerRow(Constants.Row.players)
            .onCellSelection { [weak self] (cell, row) in
                self?.output?.playersSelected()
            }

    }

}
