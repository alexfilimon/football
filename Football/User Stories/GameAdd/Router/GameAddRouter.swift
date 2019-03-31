//
//  GameAddRouter.swift
//  Football
//
//  Created by Alexander Filimonov on 28/03/2019.
//  Copyright © 2019 alexfilimon. All rights reserved.
//

import UIKit

final class GameAddRouter: GameAddRouterInput {

	// MARK: - Properties

    weak var view: ModuleTransitionable?

	// MARK: - GameAddRouterInput

    func dismiss() {
        view?.dismissView(animated: true, completion: nil)
    }

    func showError(title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .cancel, handler: nil))
        view?.presentModule(alert, animated: true, completion: nil)
    }

}
