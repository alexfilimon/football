//
//  GameDetailViewController.swift
//  Football
//
//  Created by Alexander Filimonov on 29/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit
import Eureka

final class GameDetailViewController: FormViewController, GameDetailViewInput, ModuleTransitionable {

    // MARK: - Nested types

    private enum Constants {
        public enum Row {
            static let address = "address"
            static let date = "date"

            static let hostScore = "host_score"
            static let visitorScore = "visitor_score"

            static let visitorTeam = "visitor_team"
            static let hostTeam = "host_team"
        }
    }

    // MARK: - Properties

    var output: GameDetailViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        configureForm()
        configureNavigationItem()

        output?.viewLoaded()
    }

    // MARK: - GameDetailViewInput

    func configure(with state: GameDetailViewStyle) {
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

    func setAddress(_ text: String?) {
        let row: TextRow? = form.rowBy(tag: Constants.Row.address)
        row?.value = text
    }

    func setDate(_ date: Date) {
        let row: DateRow? = form.rowBy(tag: Constants.Row.date)
        row?.value = date
    }

    func setHostScore(_ score: Int) {
        let row: IntRow? = form.rowBy(tag: Constants.Row.hostScore)
        row?.value = score
    }

    func setVisitorScore(_ score: Int) {
        let row: IntRow? = form.rowBy(tag: Constants.Row.visitorScore)
        row?.value = score
    }

    func setHostTeam(with name: String) {
        let row: TeamPlayerRow? = form.rowBy(tag: Constants.Row.hostTeam)
        row?.value = name
    }

    func setVisitorTeam(with name: String) {
        let row: TeamPlayerRow? = form.rowBy(tag: Constants.Row.visitorTeam)
        row?.value = name
    }

    // MARK: - Actions

    @objc
    private func save() {
        output?.save()
    }

    private func configureNavigationItem() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: nil, style: .plain, target: nil, action: nil)
    }

    private func configureForm() {
        form +++ Section("Информация")

            <<< DateRow(Constants.Row.date) {
                $0.title = "Дата*"
                $0.maximumDate = Date()
                $0.validationOptions = .validatesOnChange
            }
            .onChange { [weak self] (row) in
                self?.output?.dateEdited(row.value ?? Date())
            }

            <<< TextRow(Constants.Row.address) {
                $0.title = "Адрес"
                $0.placeholder = "Воронеж"
                $0.validationOptions = .validatesOnChange
            }
            .onChange { [weak self] (row) in
                self?.output?.addressEdited(row.value)
            }

        form +++ Section("Хозяева")

            <<< TeamPlayerRow(Constants.Row.hostTeam) {
                $0.title = "Команда*"
            }
            .onCellSelection { [weak self] (cell, row) in
                self?.output?.hostTeamSelected()
            }

            <<< IntRow(Constants.Row.hostScore) {
                $0.title = "Счет*"
            }
            .onChange { [weak self] (row) in
                self?.output?.hostScoreEdited(row.value ?? 0)
            }

        form +++ Section("Гости")

            <<< TeamPlayerRow(Constants.Row.visitorTeam) {
                $0.title = "Команда*"
            }
            .onCellSelection { [weak self] (cell, row) in
                self?.output?.visitorTeamSelected()
            }

            <<< IntRow(Constants.Row.visitorScore) {
                $0.title = "Счет*"
            }
            .onChange { [weak self] (row) in
                self?.output?.visitorScoreEdited(row.value ?? 0)
            }

    }

}
