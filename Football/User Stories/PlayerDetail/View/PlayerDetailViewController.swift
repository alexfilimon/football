//
//  PlayerDetailViewController.swift
//  Football
//
//  Created by Alexander Filimonov on 22/04/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit
import Eureka

final class PlayerDetailViewController: FormViewController, PlayerDetailViewInput, ModuleTransitionable {

    // MARK: - Nested types

    private enum Constants {
        public enum Row {
            static let name = "name"
            static let phone = "phone"
            static let email = "email"
            static let address = "address"
            static let number = "number"
        }
    }

    // MARK: - Properties

    var output: PlayerDetailViewOutput?

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        configureForms()
        output?.viewLoaded()
    }

    // MARK: - PlayerDetailViewInput

    func configure(with state: PlayerDetailViewStyle) {
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

    func setEmail(_ text: String?) {
        let row: TextRow? = form.rowBy(tag: Constants.Row.email)
        row?.value = text
    }

    func setPhone(_ text: String?) {
        let row: PhoneRow? = form.rowBy(tag: Constants.Row.phone)
        row?.value = text
    }

    func setAddress(_ text: String?) {
        let row: TextRow? = form.rowBy(tag: Constants.Row.address)
        row?.value = text
    }

    func setNumber(_ num: Int16) {
        let row: IntRow? = form.rowBy(tag: Constants.Row.number)
        row?.value = Int(num)
    }

    // MARK: - Actions

    @objc
    private func save() {
        output?.save()
    }

    // MARK: - Private methods

    private func configureForms() {
        form +++ Section("Информация")
            <<< TextRow(Constants.Row.name) {
                $0.title = "Имя*"
                $0.placeholder = "Иван Петров"
                $0.validationOptions = .validatesOnChange
            }
            .onChange { [weak self] (row) in
                self?.output?.nameEdited(row.value)
            }

            <<< IntRow(Constants.Row.number) {
                $0.title = "Номер*"
                $0.placeholder = "7"
                $0.validationOptions = .validatesOnChange
            }
            .onChange { [weak self] (row) in
                self?.output?.numberEdited(Int16(row.value ?? 0))
            }

            <<< PhoneRow(Constants.Row.phone) {
                $0.title = "Телефон"
                $0.placeholder = "8 999 999 99 99"
            }
            .onChange { [weak self] (row) in
                self?.output?.phoneEdited(row.value)
            }

            <<< TextRow(Constants.Row.email) {
                $0.title = "Почта"
                $0.placeholder = "email@mail.ru"
            }
            .onChange { [weak self] (row) in
                self?.output?.emailEdited(row.value)
            }

            <<< TextRow(Constants.Row.address) {
                $0.title = "Адрес"
                $0.placeholder = "Воронеж"
            }
            .onChange { [weak self] (row) in
                self?.output?.addressEdited(row.value)
            }
    }

}
