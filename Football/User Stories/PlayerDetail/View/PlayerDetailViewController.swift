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
            title = "Редактирование"
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

    // MARK: - Actions

    @objc
    private func save() {
        let validationErrors = form.validate()
        if validationErrors.isEmpty {
            output?.save()
        } else {
            print("errors: \(validationErrors)")
        }
    }

    // MARK: - Private methods

    private func configureForms() {
        form +++ Section("Информация")
            <<< NameRow() {
                $0.title = "Имя"
                $0.placeholder = "Иван"
                $0.add(rule: RuleRequired())
                $0.validationOptions = .validatesOnChange
            }
            .onChange { [weak self] (row) in
                self?.output?.nameEdited(row.value)
            }
            <<< PhoneRow() {
                $0.title = "Телефон"
                $0.placeholder = "8 999 999 99 99"
                $0.add(rule: RuleRequired())
            }
            .onChange { [weak self] (row) in
                self?.output?.phoneEdited(row.value)
            }
            <<< EmailRow() {
                $0.title = "Почта"
                $0.placeholder = "email@mail.ru"
                $0.add(rule: RuleRequired())
            }
            .onChange { [weak self] (row) in
                self?.output?.emailEdited(row.value)
            }
            <<< TextRow() {
                $0.title = "Адрес"
                $0.placeholder = "Воронеж"
                $0.add(rule: RuleRequired())
                }
            .onChange { [weak self] (row) in
                self?.output?.addressEdited(row.value)
            }
    }

}
