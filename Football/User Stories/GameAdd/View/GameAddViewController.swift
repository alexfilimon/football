//
//  GameAddViewController.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit
import SurfUtils

final class GameAddViewController: UIViewController, GameAddViewInput, ModuleTransitionable {

    // MARK: - IBOutlets

    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var hostLabel: UILabel!
    @IBOutlet private weak var hostNameTextField: UITextField!
    @IBOutlet private weak var hostScoreTextField: UITextField!
    @IBOutlet private weak var visitorLabel: UILabel!
    @IBOutlet private weak var visitorNameTextField: UITextField!
    @IBOutlet private weak var visitorScoreTextField: UITextField!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var dateTextField: UITextField!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var addressTextField: UITextField!

    // MARK: - Properties

    var output: GameAddViewOutput?
    private var date = Date() {
        didSet {
            setupDate()
        }
    }
    private let dateFormatString = "dd.MM.yyyy"

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        configureAppearance()
        output?.viewLoaded()
    }

    // MARK: - Initialization and deinitialization

    deinit {
        unsubscribeFromKeyboardNotifications()
    }

    // MARK: - GameAddViewInput

    func updateTextFields(hostTeamName: String?,
                          visitorTeamName: String?,
                          hostTeamScore: Int?,
                          visitorTeamScore: Int?,
                          address: String?,
                          date: Date?) {
        if let hostTeamName = hostTeamName {
            hostNameTextField.text = hostTeamName
        } else {
            hostNameTextField.placeholder = "Реал мадрид"
        }
        if let visitorTeamName = visitorTeamName {
            visitorNameTextField.text = visitorTeamName
        } else {
            visitorNameTextField.placeholder = "Барселона"
        }
        if let hostTeamScore = hostTeamScore {
            hostScoreTextField.text = String(hostTeamScore)
        } else {
            hostScoreTextField.text = "0"
        }
        if let visitorTeamScore = visitorTeamScore {
            visitorScoreTextField.text = String(visitorTeamScore)
        } else {
            visitorScoreTextField.text = "0"
        }
        if let address = address {
            addressTextField.text = address
        } else {
            addressTextField.placeholder = "Москва, стадион 'Локомотив'"
        }
        if let date = date {
            self.date = date
        }
    }

    func setTitle(_ title: String) {
        navigationItem.title = title
    }

    // MARK: - Private configurators

    private func configureAppearance() {

        hostLabel.text = "Команда хозяев"
        visitorLabel.text = "Команда гостей"

        hostScoreTextField.keyboardType = .numberPad
        visitorScoreTextField.keyboardType = .numberPad

        addressLabel.text = "Адрес"
        configureDateLabel()

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                           target: self,
                                                           action: #selector(cancelPressed))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                            target: self,
                                                            action: #selector(savePressed))

        subscribeOnKeyboardNotifications()
        scrollView.keyboardDismissMode = .interactive
    }

    private func configureDateLabel() {
        dateLabel.text = "Дата"
        dateTextField.inputView = getDatePicker()
        dateTextField.inputAccessoryView = getToolBar()
        setupDate()
    }

    // MARK: - Private methods

    private func getDatePicker() -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.maximumDate = Date()
        datePicker.locale = Locale.current
        datePicker.addTarget(self,
                             action: #selector(datePickerValueChanded(sender:)),
                             for: .valueChanged)
        return datePicker
    }

    private func getToolBar() -> UIToolbar {
        let toolbar = UIToolbar()

        toolbar.isTranslucent = true
        toolbar.barStyle = .default
        toolbar.tintColor = .black

        let doneButton = UIBarButtonItem(title: "Готово",
                                         style: .done,
                                         target: self,
                                         action: #selector(donePressed(sender:)))

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                        target: self,
                                        action: nil)

        let nowButton = UIBarButtonItem(title: "Сейчас",
                                        style: .plain,
                                        target: self,
                                        action: #selector(nowPressed(sender:)))

        toolbar.setItems([nowButton, flexSpace, doneButton], animated: true)

        toolbar.sizeToFit()
        toolbar.isUserInteractionEnabled = true

        return toolbar
    }

    private func setupDate() {
        dateTextField.text = date.getString(format: dateFormatString)
        if let picker = dateTextField.inputView as? UIDatePicker {
            picker.date = date
        }
    }

    // MARK: - Actions

    @objc
    private func donePressed(sender: UIBarButtonItem) {
        view.endEditing(true)
    }

    @objc
    private func nowPressed(sender: UIBarButtonItem) {
        date = Date()
    }

    @objc
    private func datePickerValueChanded(sender: UIDatePicker) {
        self.date = sender.date
    }

    @objc
    private func cancelPressed() {
        output?.cancel()
    }

    @objc
    private func savePressed() {
        if let hostTeamName = hostNameTextField.text {
            output?.setHostTeam(hostTeamName)
        }
        if let visitorTeamName = visitorNameTextField.text {
            output?.setVisitorTeam(visitorTeamName)
        }
        if let hostTeamScore = hostScoreTextField.text {
            output?.setHostScore(hostTeamScore)
        }
        if let visitorTeamScore = visitorScoreTextField.text {
            output?.setVisitorScore(visitorTeamScore)
        }
        if let address = addressTextField.text {
            output?.setAddress(address)
        }
        output?.setDate(date)
        output?.save()
    }

}

// MARK: - KeyboardObservable

extension GameAddViewController: KeyboardObservable {
    func keyboardWillBeShown(notification: Notification) {
        guard let keyboardFrame = notification.keyboardInfo.frameEnd else {
            return
        }
        scrollView.contentInset.bottom = keyboardFrame.height
        scrollView.scrollIndicatorInsets.bottom = keyboardFrame.height
    }

    func keyboardWillBeHidden(notification: Notification) {
        scrollView.contentInset.bottom = 0
        scrollView.scrollIndicatorInsets.bottom = 0
    }
}
